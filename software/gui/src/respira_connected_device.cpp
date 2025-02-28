/* Copyright 2020-2021, RespiraWorks

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

#include "respira_connected_device.h"

// In Alpha Cycle controller transmits every 30ms, but sometimes it takes
// longer, 42 being a safe bet
static constexpr DurationMs INTER_FRAME_TIMEOUT_MS = DurationMs(42);

// GuiStatus is about 150 bytes, resulting in 13ms tx time. Output buffer
// will usually swallow it immeadetely, but just in case we set a timeout.
static constexpr DurationMs WRITE_TIMEOUT_MS = DurationMs(15);

RespiraConnectedDevice::RespiraConnectedDevice(QString portName) : serialPortName_(portName) {}

RespiraConnectedDevice::~RespiraConnectedDevice() {
  if (serialPort_ != nullptr) {
    serialPort_->close();
  }
}

// Creates the QSerialPort in the current thread context.
// We can't provide it from outside context because of Qt mechanisms.
bool RespiraConnectedDevice::createPortMaybe() {
  if (serialPort_ != nullptr) return true;

  serialPort_ = std::make_unique<QSerialPort>();
  serialPort_->setPortName(serialPortName_);
  serialPort_->setBaudRate(QSerialPort::Baud115200);
  serialPort_->setDataBits(QSerialPort::Data8);
  serialPort_->setParity(QSerialPort::NoParity);
  serialPort_->setStopBits(QSerialPort::OneStop);
  serialPort_->setFlowControl(QSerialPort::NoFlowControl);

  if (!serialPort_->open(QIODevice::ReadWrite)) {
    return false;
  }
  return true;
}

bool RespiraConnectedDevice::SendGuiStatus(const GuiStatus &gui_status) {
  if (!createPortMaybe()) {
    CRIT("Could not open serial port for sending {}", serialPortName_.toStdString());
    // TODO Raise an Alert?
    return false;
  }

  uint8_t tx_buffer[GuiStatus_size];

  pb_ostream_t stream = pb_ostream_from_buffer(tx_buffer, sizeof(tx_buffer));
  if (!pb_encode(&stream, GuiStatus_fields, &gui_status)) {
    // TODO Raise an Alert?
    CRIT("Could not serialize GuiStatus");
    return false;
  }

  serialPort_->write((const char *)tx_buffer, stream.bytes_written);

  if (!serialPort_->waitForBytesWritten(WRITE_TIMEOUT_MS.count())) {
    // TODO Raise an Alert?
    CRIT("Timeout while sending GuiStatus");
    return false;
  }
  return true;
}

bool RespiraConnectedDevice::ReceiveControllerStatus(ControllerStatus *controller_status) {
  if (!createPortMaybe()) {
    CRIT("Could not open serial port for reading {}", serialPortName_.toStdString());
    // TODO Raise an Alert?
    return false;
  }

  // wait for incomming data
  if (!serialPort_->waitForReadyRead(INTER_FRAME_TIMEOUT_MS.count())) {
    // TODO Raise an Alert?
    CRIT("Timeout while waiting for a serial frame from Cycle Controller");
    return false;
  }

  QByteArray responseData = serialPort_->readAll();

  // continue reading characters until we don't see
  // any data for long enough to estimate end of packet silence
  while (serialPort_->waitForReadyRead(INTER_FRAME_TIMEOUT_MS.count() / 5)) {
    responseData += serialPort_->readAll();
  }

  pb_istream_t stream =
      pb_istream_from_buffer((const uint8_t *)responseData.data(), responseData.length());

  if (!pb_decode(&stream, ControllerStatus_fields, controller_status)) {
    CRIT("Could not de-serialize received data as Controller Status");
    // TODO: Raise an Alert?
    return false;
  }

  return true;
}
