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

#include "interface.h"

#include "binary_utils.h"
#include "hal.h"
#include "system_timer.h"

namespace Debug {
// Initialize interface handler with variable list of
// Command::Code, Command::Handler pairs and a trace
Interface::Interface(Trace *trace, int count, ...) {
  trace_ = trace;

  // Add the provided handlers to the registry, unless an odd number of
  // arguments have been provided
  va_list valist;
  va_start(valist, count);
  for (int i = 0; i < count / 2; ++i) {
    Command::Code code = va_arg(valist, Command::Code);
    Command::Handler *handler = va_arg(valist, Command::Handler *);
    registry_[static_cast<uint8_t>(code)] = handler;
  }
  va_end(valist);  // clean memory reserved for valist
}

// This function is called from the main low priority background loop.
// Its a simple state machine that waits for a new command to be received
// over the debug serial port.  Process the command when one is received
// and sends the response back.
bool Interface::Poll() {
  switch (state_) {
    // Waiting for a new command to be received.
    // I continue to process bytes until there are no more available,
    // or a full command has been received.  Either way, the
    // ReadNextByte function will return false when its time
    // to move on.
    case State::AwaitingCommand:
      while (ReadNextByte()) {
      }
      return false;

    // Process the current command
    case State::Processing:
      ProcessCommand();
      request_size_ = 0;
      return false;

    // Wait for command to be processed
    case State::AwaitingResponse:
      if (command_processed_) {
        SendResponse(ErrorCode::None, response_length_);
      } else if (SystemTimer::singleton().now() > command_start_time_ + milliseconds(100)) {
        SendError(ErrorCode::Timeout);
      }
      return false;

    // Send my response
    case State::Responding:
      while (SendNextByte()) {
      }
      return true;
  }
  return false;
}

// Read the next byte from the debug serial port.
// Returns false if there were no more bytes available.
// Also returns false if a full command has been received.
bool Interface::ReadNextByte() {
  // Get the next byte from the debug serial port if there is one.
  char next_char;
  if (hal.DebugRead(&next_char, 1) < 1) return false;

  uint8_t byte = static_cast<uint8_t>(next_char);

  // If the previous character received was an escape character
  // then just save this byte (assuming there's space)
  if (escape_next_byte_) {
    escape_next_byte_ = false;

    if (request_size_ < std::size(request_)) request_[request_size_++] = byte;
    return true;
  }

  // If this is an escape character, don't save it just keep track
  // of the fact that we saw it.
  if (byte == static_cast<uint8_t>(SpecialChar::Escape)) {
    escape_next_byte_ = true;
    return true;
  }

  // If this is an termination character, then change our state and return false
  if (byte == static_cast<uint8_t>(SpecialChar::EndTransfer)) {
    state_ = State::Processing;
    return false;
  }

  // For other characters, just save them if there's space in the buffer
  if (request_size_ < std::size(request_)) request_[request_size_++] = byte;
  return true;
}

// Send the next byte of my response to the last command.
// Returns false if no more data will fit in the output buffer,
// or if the entire response has been sent.
bool Interface::SendNextByte() {
  // To simplify things below, I require at least 3 bytes
  // in the output buffer to continue
  if (hal.DebugBytesAvailableForWrite() < 3) return false;

  // See what the next character to send is.
  char next_char = response_[response_bytes_sent_++];

  // If its a special character, I need to escape it.
  if ((next_char == static_cast<char>(SpecialChar::EndTransfer)) ||
      (next_char == static_cast<char>(SpecialChar::Escape))) {
    char escaped_char[2];
    escaped_char[0] = static_cast<char>(SpecialChar::Escape);
    escaped_char[1] = next_char;
    (void)hal.DebugWrite(escaped_char, 2);
  } else {
    (void)hal.DebugWrite(&next_char, 1);
  }

  // If there's more response to send, return true
  if (response_bytes_sent_ < response_size_) return true;

  // If that was the last byte in my response, send the
  // termination character and start waiting on the next
  // command.
  char end_transfer = static_cast<char>(SpecialChar::EndTransfer);
  (void)hal.DebugWrite(&end_transfer, 1);

  state_ = State::AwaitingCommand;
  response_bytes_sent_ = 0;
  return false;
}

// Process the received command
void Interface::ProcessCommand() {
  // The total number of bytes received (not including the termination byte)
  // is the value of request_size_, which should be at least 3 (8 bits command
  // code + 16 bits checksum). If its not, I just ignore the command and jump to
  // waiting for the next one.
  // This means we can send EndTransfer characters to synchronize
  // communication if necessary
  if (request_size_ < 3) {
    request_size_ = 0;
    state_ = State::AwaitingCommand;
    return;
  }

  uint16_t crc = ComputeCRC(request_, request_size_ - 2);

  if (crc != u8_to_u16(&request_[request_size_ - 2])) {
    SendError(ErrorCode::CrcError);
    return;
  }

  Command::Handler *cmd_handler = registry_[request_[0]];
  if (!cmd_handler) {
    SendError(ErrorCode::UnknownCommand);
    return;
  }

  command_processed_ = false;
  // The length that we pass in to the command handler doesn't
  // include the command code or CRC.  The max size is also reduced
  // by 3 to make sure we can add the error code and CRC.
  Command::Context context = {
      .request = &request_[1],
      .request_length = request_size_ - 3,
      .response = &response_[1],
      .max_response_length = sizeof(response_) - 3,
      .response_length = 0,
      .processed = &command_processed_,
  };
  ErrorCode error = cmd_handler->Process(&context);

  if (error != ErrorCode::None) {
    SendError(error);
    return;
  }

  state_ = State::AwaitingResponse;
  command_start_time_ = SystemTimer::singleton().now();
  response_length_ = context.response_length;
}

void Interface::SendResponse(ErrorCode error, uint32_t response_length) {
  response_[0] = static_cast<uint8_t>(error);

  // Calculate the CRC on the data and error code returned
  // and append this to the end of the response
  uint16_t crc = ComputeCRC(response_, response_length + 1);
  u16_to_u8(crc, &response_[response_length + 1]);
  state_ = State::Responding;
  response_bytes_sent_ = 0;
  // The size of the response that will be sent includes the error code (1 byte)
  // and checksum (2 bytes).
  response_size_ = response_length + 3;
}

// 16-bit CRC calculation for debug commands and responses
uint16_t Interface::ComputeCRC(const uint8_t *buffer, size_t length) {
  static constexpr uint16_t CRC16POLY = 0xA001;
  static bool Init = false;
  static uint16_t CrcTable[256];

  // The first time this is called I'll build a table
  // to speed up CRC handling
  if (!Init) {
    Init = true;
    for (uint16_t byte = 0; byte < 256; byte++) {
      uint16_t crc = byte;

      for (uint8_t bit_number = 0; bit_number < 8; bit_number++) {
        bool lsb = (crc & 1) == 1;
        crc = static_cast<uint16_t>(crc >> 1);
        if (lsb) crc ^= CRC16POLY;
      }

      CrcTable[byte] = crc;
    }
  }

  uint16_t crc = 0;

  for (uint32_t byte_number = 0; byte_number < length; byte_number++) {
    uint16_t local_crc = CrcTable[0xFF & (buffer[byte_number] ^ crc)];

    crc = static_cast<uint16_t>(local_crc ^ (crc >> 8));
  }
  return crc;
}

}  // namespace Debug
