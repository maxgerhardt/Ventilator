/* Copyright 2020, RespiraWorks

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/*
 * module contributors: verityRF
 *
 * The purpose of this module is to provide unit testing for the sensors
 * controller module.  Module is to be run on an x86 host and is not to be run
 * on an Arduino platform.
 */

#include "sensors.h"

#include <assert.h>

#include <cmath>
#include <cstdio>
#include <iostream>
#include <string>

#include "flow_integrator.h"
#include "gtest/gtest.h"
#include "hal.h"
#include "system_timer.h"

// Maximum allowable delta between calculated sensor readings and the input.
static const Pressure ComparisonTolerancePressure{kPa(0.005f)};
static const VolumetricFlow ComparisonToleranceFlow{ml_per_sec(50)};
static const float ComparisonToleranceFIO2{0.001f};

// \TODO lots of assumptions here...
static constexpr float air_density{1.225f};  // kg/m^3
constexpr static Length venturi_port_diameter{millimeters(15.05f)};
constexpr static Length venturi_choke_diameter{millimeters(5.5f)};
constexpr static float venturi_correction{0.97f};
static VenturiFlowSensor typical_venturi{
    "", "", nullptr, venturi_port_diameter, venturi_choke_diameter, venturi_correction};

#define EXPECT_PRESSURE_NEAR(a, b) \
  EXPECT_NEAR((a).kPa(), (b).kPa(), ComparisonTolerancePressure.kPa())

#define EXPECT_FLOW_NEAR(a, b) \
  EXPECT_NEAR((a).ml_per_sec(), (b).ml_per_sec(), ComparisonToleranceFlow.ml_per_sec())

//@TODO: Finish writing more specific unit tests for this module

/*
 * @brief This method models the pressure to voltage transfer function of the
 * MPXV5004 series sensors.  The raw voltage coming out of the sensor would be
 * 5 * (...), but our PCB scales it down to 3.3f * (...) so that the pressure
 * range (0-4kPa) is in the voltage range 0-3.3V.
 */
static Voltage MPXV5004_PressureToVoltage(Pressure pressure) {
  return volts(ADC::VoltageRange.volts() * (0.2f * pressure.kPa() + 0.2f));
}

// @brief This method models the pressure to voltage transfer function of the
// MPXV5010 series sensors.  The raw voltage coming out of the sensor would be
// 5 * 0.45 * (...), but our board scales it down to 3.3f * (...) so that the
// pressure range (0-10kPa) is in the voltage range 0-3.3V.

static Voltage MPXV5010_PressureToVoltage(Pressure pressure) {
  return volts(ADC::VoltageRange.volts() * (0.09f * pressure.kPa() + 0.04f));
}
// This method models the oxygen sensor. Voltage reads partial pressure of O2
// and needs ambient pressure to modulate output voltage.
// Sensitivity is 0.061 V/pt at 1 atm and assumed to vary linearly with pressure
// Offset is assumed to be 10 mV
// Analog amplifier with gain 50 is used on the PCB
static Voltage FIO2ToVoltage(float fio2, Pressure p_amb) {
  return volts(fio2 * p_amb.atm() * 0.06f + 0.01f) * 50.0f;
}

// Function that helps change the readings by setting the pressure sensor pins,
// advancing time and then getting sensors readings
static SensorReadings update_readings(Duration dt, Pressure oxygen_influx_dp,
                                      Pressure patient_pressure, Pressure air_influx_dp,
                                      Pressure outflow_dp, Pressure p_amb, float fio2,
                                      Sensors *sensors) {
  sensors->adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                                MPXV5010_PressureToVoltage(patient_pressure));
  sensors->adc.TESTSetAnalogPin(adc_channel(Sensor::OxygenInflowPressureDiff).adc_channel,
                                MPXV5004_PressureToVoltage(oxygen_influx_dp));
  sensors->adc.TESTSetAnalogPin(adc_channel(Sensor::AirInflowPressureDiff).adc_channel,
                                MPXV5004_PressureToVoltage(air_influx_dp));
  sensors->adc.TESTSetAnalogPin(adc_channel(Sensor::OutflowPressureDiff).adc_channel,
                                MPXV5004_PressureToVoltage(outflow_dp));
  sensors->adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel, FIO2ToVoltage(fio2, p_amb));
  SystemTimer::singleton().delay(dt);
  return sensors->get_readings();
}

TEST(SensorTests, FullScalePressureReading) {
  Sensors sensors;
  sensors.init(HalApi::GetCpuFreq());
  // These pressure waveforms start at 0 kPa to simulate the system being in the
  // proper calibration state then they go over the sensor full ranges.
  std::vector<Pressure> pressures = {kPa(0.0f), kPa(0.5f), kPa(1.0f), kPa(1.5f), kPa(2.0f),
                                     kPa(2.5f), kPa(3.0f), kPa(3.5f), kPa(3.92f)};

  // Will pad the rest of the simulated analog signals with ambient pressure
  // readings (0 kPa) voltage equivalents
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                               MPXV5010_PressureToVoltage(kPa(0)));
  // First set the simulated analog signals to an ambient 0 kPa corresponding
  // voltage during calibration
  Voltage voltage_at_0kPa = MPXV5004_PressureToVoltage(kPa(0));  //[V]
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OxygenInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::AirInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OutflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  // Set fio2 signal to allow calibration
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel,
                               FIO2ToVoltage(0.21f, atm(1.0f)));
  sensors.calibrate();

  // Now to compare the pressure readings the sensor module is calculating
  // versus what the original pressure waveform was
  for (auto p : pressures) {
    SCOPED_TRACE("Pressure " + std::to_string(p.kPa()));
    sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                                 MPXV5010_PressureToVoltage(p));
    EXPECT_PRESSURE_NEAR(sensors.get_readings().patient_pressure, p);
  }
}

TEST(SensorTests, FiO2Reading) {
  Sensors sensors;
  sensors.init(HalApi::GetCpuFreq());

  // calibrate O2 sensor at 21% fio2, 1atm
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel,
                               FIO2ToVoltage(0.21f, atm(1.0f)));
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                               MPXV5010_PressureToVoltage(kPa(0)));
  // Set the other sensors to reasonable values to allow calibration
  Voltage voltage_at_0kPa = MPXV5004_PressureToVoltage(kPa(0));
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OxygenInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::AirInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OutflowPressureDiff).adc_channel,
                               voltage_at_0kPa);

  sensors.calibrate();

  // fio2 profile
  std::vector<float> fio2_settings = {0.0,  0.1f,  0.25f, 0.33f, 0.4f,
                                      0.6f, 0.66f, 0.75f, 0.9f,  1.0f};
  // sweep all fio2 settings and 1 atm pressure
  for (auto fio2 : fio2_settings) {
    SCOPED_TRACE("fio2 " + std::to_string(fio2));
    sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel,
                                 FIO2ToVoltage(fio2, atm(1.0f)));
    EXPECT_NEAR(sensors.get_readings().fio2, fio2, ComparisonToleranceFIO2);
  }
  // TODO: check the effect of ambient pressure once the system has a way to
  // know
  // ambient pressure (either through a sensor or through a user input?)
}

// These tests expect Venturi Diamters of 15.05mm and 5.5mm with a "discharge
// coefficient" of 0.97.  If VENTURI_PORT_DIAM or VENTURI_CHOKE_DIAM change,
// this test will fail until you update it.
//
// Expected values from https://www.wolframalpha.com/input/?i=Venturi+flowmeter
TEST(SensorTests, TestVolumetricFlowCalculation) {
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(1.0f), air_density),
                   ml_per_sec(939.6f));
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(-1.0f), air_density),
                   ml_per_sec(-939.6f));
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(0.0f), air_density), ml_per_sec(0));
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(1.0e-7f), air_density),
                   ml_per_sec(0.2971f));
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(100.0f), air_density),
                   ml_per_sec(9396));
  EXPECT_FLOW_NEAR(typical_venturi.pressure_delta_to_flow(kPa(-100.0f), air_density),
                   ml_per_sec(-9396));
}

TEST(SensorTests, TotalFlowCalculation) {
  Sensors sensors;
  sensors.init(HalApi::GetCpuFreq());

  // These pressure waveforms start at 0 kPa to simulate the system being in the
  // proper calibration state then they go over the sensor full ranges with
  // less samples than for FullScaleReadings.
  std::vector<Pressure> pressures = {kPa(0.0f), kPa(0.5f), kPa(1.0f), kPa(2.0f), kPa(3.5f)};

  // First set the simulated analog signals to an ambient 0 kPa corresponding
  // voltage during calibration
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                               MPXV5010_PressureToVoltage(kPa(0)));
  Voltage voltage_at_0kPa = MPXV5004_PressureToVoltage(kPa(0));  //[V]
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OxygenInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::AirInflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OutflowPressureDiff).adc_channel,
                               voltage_at_0kPa);
  // Set fio2 signal to allow calibration
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel,
                               FIO2ToVoltage(0.21f, atm(1.0f)));

  sensors.calibrate();

  for (auto p_air_in : pressures) {
    for (auto p_oxy_in : pressures) {
      for (auto p_out : pressures) {
        auto readings = update_readings(
            /*dt=*/seconds(0.0f), p_oxy_in, /*patient_pressure=*/kPa(0.0f), p_air_in, p_out,
            atm(1.0f), /*fio2=*/0.21f, &sensors);
        EXPECT_FLOW_NEAR(readings.air_inflow,
                         typical_venturi.pressure_delta_to_flow(p_air_in, air_density));
        EXPECT_FLOW_NEAR(readings.oxygen_inflow,
                         typical_venturi.pressure_delta_to_flow(p_oxy_in, air_density));
        EXPECT_FLOW_NEAR(readings.outflow,
                         typical_venturi.pressure_delta_to_flow(p_out, air_density));
      }
    }
  }
}

TEST(SensorTests, Calibration) {
  Sensors sensors;
  sensors.init(HalApi::GetCpuFreq());

  // First set the simulated analog signals to randomly chosen signals
  // corresponding to conditions during calibration
  Pressure init_oxy_inflow_delta = kPa(0.09f);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OxygenInflowPressureDiff).adc_channel,
                               MPXV5004_PressureToVoltage(init_oxy_inflow_delta));
  Pressure init_pressure = kPa(0.23f);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::PatientPressure).adc_channel,
                               MPXV5010_PressureToVoltage(init_pressure));
  Pressure init_air_inflow_delta = kPa(0.15f);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::AirInflowPressureDiff).adc_channel,
                               MPXV5004_PressureToVoltage(init_air_inflow_delta));
  Pressure init_outflow_delta = kPa(-0.13f);
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::OutflowPressureDiff).adc_channel,
                               MPXV5004_PressureToVoltage(init_outflow_delta));
  float init_fio2 = 0.15f;
  sensors.adc.TESTSetAnalogPin(adc_channel(Sensor::FIO2).adc_channel,
                               FIO2ToVoltage(init_fio2, atm(1.0f)));

  sensors.calibrate();

  // get the sensor readings for the init signals, expect 0 (except for fio2,
  // which assumes 0.21 during calibration instead of 0)
  SensorReadings readings = sensors.get_readings();

  EXPECT_FLOW_NEAR(readings.oxygen_inflow, ml_per_sec(0.0f));
  EXPECT_PRESSURE_NEAR(readings.patient_pressure, kPa(0.0f));
  EXPECT_FLOW_NEAR(readings.air_inflow, ml_per_sec(0.0f));
  EXPECT_FLOW_NEAR(readings.outflow, ml_per_sec(0.0f));
  EXPECT_NEAR(readings.fio2, 0.21f, ComparisonToleranceFIO2);

  // set measured signals to 0 and expect -1*init values (plus 0.21 for fio2)
  readings = update_readings(/*dt=*/seconds(0),
                             /*oxy_influx_dp=*/kPa(0),
                             /*patient_pressure=*/kPa(0),
                             /*air_influx_dp=*/kPa(0),
                             /*outflow_dp=*/kPa(0),
                             /*ambient pressure=*/atm(1.0f),
                             /*fio2=*/0.0f, &sensors);

  EXPECT_FLOW_NEAR(readings.oxygen_inflow,
                   -1 * typical_venturi.pressure_delta_to_flow(init_oxy_inflow_delta, air_density));
  EXPECT_PRESSURE_NEAR(readings.patient_pressure, cmH2O(-1 * init_pressure.cmH2O()));
  EXPECT_FLOW_NEAR(readings.air_inflow,
                   -1 * typical_venturi.pressure_delta_to_flow(init_air_inflow_delta, air_density));
  EXPECT_FLOW_NEAR(readings.outflow,
                   -1 * typical_venturi.pressure_delta_to_flow(init_outflow_delta, air_density));
  EXPECT_NEAR(readings.fio2, 0.21f - init_fio2, ComparisonToleranceFIO2);

  // set measured signals to some random values + init values and expect init
  // value to be removed from the readings (once again, except for fio2, which
  // removes init value and add 0.21)
  readings = update_readings(
      /*dt=*/seconds(0),
      /*oxygen_influx_dp=*/kPa(0.6f) + init_oxy_inflow_delta,
      /*patient_pressure=*/kPa(-0.5f) + init_pressure,
      /*air_influx_dp=*/kPa(1.1f) + init_air_inflow_delta,
      /*outflow_dp=*/kPa(0.01f) + init_outflow_delta,
      /*ambient_pressure=*/atm(1.0f),
      /*fio2=*/0.25f + init_fio2, &sensors);

  EXPECT_FLOW_NEAR(readings.oxygen_inflow,
                   typical_venturi.pressure_delta_to_flow(kPa(0.6f), air_density));
  EXPECT_PRESSURE_NEAR(readings.patient_pressure, kPa(-0.5f));
  EXPECT_FLOW_NEAR(readings.air_inflow,
                   typical_venturi.pressure_delta_to_flow(kPa(1.1f), air_density));
  EXPECT_FLOW_NEAR(readings.outflow,
                   typical_venturi.pressure_delta_to_flow(kPa(0.01f), air_density));
  EXPECT_NEAR(readings.fio2, 0.25f + 0.21f, ComparisonToleranceFIO2);
}
