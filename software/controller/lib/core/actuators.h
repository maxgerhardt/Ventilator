/* Copyright 2020-2022, RespiraWorks

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

// This module is responsible for passing the actuator commands to hal to
// generate the actual electrical signals.

#pragma once

#include "pinch_valve.h"

struct ActuatorsState {
  // Valve setting for the FIO2 proportional solenoid
  // Range 0 to 1 where 0 is fully closed and 1 is fully open.
  float fio2_valve{0.0f};

  // Power for the blower fan.  Range 0 (off) to 1 (full power)
  float blower_power{0.0f};

  // Pinch valve that regulates output of the blower.
  // If the valve is disabled, then this is nullopt.
  // If enabled the range is 0 (fully closed) to 1 (fully open)
  std::optional<float> blower_valve;

  // Pinch valve that regulates exaust flow
  // If the valve is disabled, then this is nullopt.
  // If enabled the range is 0 (fully closed) to 1 (fully open)
  std::optional<float> exhale_valve;
};

class Actuators {
 public:
  Actuators(int blower_motor_index, int exhale_motor_index)
      : blower_pinch_("blower_valve_", " of the blower pinch valve", blower_motor_index),
        exhale_pinch_("exhale_valve_", " of the exhale pinch valve", exhale_motor_index){};

  // Returns true if the actuators are ready for action or false
  // if they aren't (for example pinch valves are homing).
  // The system should be kept in a safe state until this returns true.
  bool ready();

  // Creates pwm actuators and links actuators calibration tables to nv_params.
  void init(Frequency cpu_frequency, NVParams::Handler *nv_params, uint16_t blower_pinch_cal_offset,
            uint16_t exhale_pinch_cal_offset, uint16_t blower_cal_offset, uint16_t psol_cal_offset);

  // Causes passed state to be applied to the actuators
  void execute(const ActuatorsState &desired_state);

 private:
  PinchValve blower_pinch_;
  PinchValve exhale_pinch_;
  // Blower, PSol and buzzer use pwm pins and need to be instantiated after HAL, therefore we
  // use std::optional to delay the instantiation within init function.
  std::optional<PwmActuator> blower_{std::nullopt};
  std::optional<PwmActuator> psol_{std::nullopt};

 public:
  // buzzer is made public to allow easier manipulation (not through actuators.execute()).
  std::optional<PwmActuator> buzzer{std::nullopt};
};
