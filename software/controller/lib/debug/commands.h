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

#pragma once

#include "binary_utils.h"
#include "eeprom.h"
#include "interface.h"

namespace Debug::Command {

// Mode command.
// This returns a single byte of data which gives the firmware mode:
//  0 - Running in normal mode
//  1 - Running in boot mode.
//
// We don't actually have a boot mode yet, but its only a matter of time.
// Once we start doing things like updating firmware (not through a debugger),
// we will need a separate boot loader image to ensure graceful recovery.
class ModeHandler : public Handler {
 public:
  ModeHandler() = default;
  ErrorCode Process(Context *context) override {
    context->response_length = 1;
    context->response[0] = 0;
    *(context->processed) = true;
    return ErrorCode::None;
  }
};

// When testing peek and poke on native, I need a way to feed 64 bits address
// to the handler.
// This superclass allows us to set the Most Significant Word (32 bits) of a 64
// bits address, which is then appended to the command-provided address of
// either peek or poke command.
class MemoryHandler : public Handler {
 public:
  MemoryHandler() = default;
  void SetAddressMSW(size_t address) { address_msw_ = address; }

 protected:
  size_t address_msw_{0};
};

// Peek command.
// Allows us to read raw memory values.
//
// The data passed to the command consists of a 32-bit starting address and
// a 16-bit byte count.
class PeekHandler : public MemoryHandler {
 public:
  PeekHandler() = default;
  ErrorCode Process(Context *context) override;
};
// Poke command.
// Allows us to write raw values in memory.  Use with caution!
// The data passed to the command consists of a 32-bit starting address and one
// or more data bytes to be written to consecutive addresses starting at the
// given address
class PokeHandler : public MemoryHandler {
 public:
  PokeHandler() = default;
  ErrorCode Process(Context *context) override;
};

// Trace command
// Used to download data from the trace buffer.
//
// Data passed to the command is a single byte which defines what the command
// does:
//  Flush - Used to disable the trace and flush the trace buffer
//  Download - Used to read data from the buffer
//  Start - Used to start recording in the trace buffer
//  Stop - Used to stop recording in the trace buffer
//  GetVarId followed by var index (1 byte) - Used to get trace variables ID
//  SetVarId followed by var index (1 byte) and variable ID (2 bytes) - Used to
//    set traced variable id
//  GetPeriod - Used to get the trace period
//  SetPeriod followed by desired trace period (4 bytes) - Used to set the
//    trace period
//  CountSamples - Used to get the number of samples currently in the trace
//    buffer

class TraceHandler : public Handler {
 public:
  explicit TraceHandler(Trace *trace) : trace_(trace){};
  ErrorCode Process(Context *context) override;

  enum class Subcommand : uint8_t {
    Flush = 0x00,     // disable and flush the trace buffer
    Download = 0x01,  // download data from the trace buffer
    Start = 0x02,     // start tracing data
    Stop = 0x03,      // stop tracing data
    GetVarId = 0x04,  // get traced variable id
    SetVarId = 0x05,  // set traced variable id
    GetPeriod = 0x06,
    SetPeriod = 0x07,
    CountSamples = 0x08,  // get number of samples in the trace buffer
  };

 private:
  ErrorCode ReadTraceBuffer(Context *context);
  ErrorCode SetTraceVar(Context *context);
  ErrorCode GetTraceVar(Context *context);
  Trace *trace_{nullptr};
};

// Command handler for variable access
//
// The first byte of data passed to the command gives a sub-command
// which defines what the command does and the structure of its data.
//
// Sub-commands:
//  GetInfo - Used to read info about a variable.  The debug interface calls
//             this repeatedly on startup to enumerate the variables currently
//             supported by the code.  This way new debug variables can be added
//             on the fly without modifying the Python code to match.
//
//             Input data to this command is a 16-bit variable ID (assigned
//             dynamically as variables are created).  The output is info about
//             the variable.
//             See the code below for details of the output format
//
//  Get - Read the variables value.
//
//  Set - Set the variables value.
//
//  GetCount - Used to know how many debug variables are currently active
//
class VarHandler : public Handler {
 public:
  VarHandler() = default;
  ErrorCode Process(Context *context) override;

  enum class Subcommand : uint8_t {
    GetInfo = 0x00,   // get variable info (name, type, help string)
    Get = 0x01,       // get variable value
    Set = 0x02,       // set variable value
    GetCount = 0x03,  // get count of active vars
  };

 private:
  // Return info about one of the variables. The 16-bit variable ID is passed
  // in.  These IDs are automatically assigned as variables are registered in
  // the system starting with 0.
  // The Python code can read them all out until it gets an error code
  // indicating that the passed ID is invalid.
  ErrorCode GetVarInfo(Context *context);

  ErrorCode GetVar(Context *context);

  ErrorCode SetVar(Context *context);

  ErrorCode GetVarCount(Context *context);
};

// Eeprom command.
// Allows us to read/write raw values in I2C EEPROM.
// The first byte of data passed to the command gives a sub-command
// which defines what the command does and the structure of its data.
//
// Sub-commands:
//  Read, followed by a 16 bits address and a 16 bits length :
//          Used to read length data bytes at given address in EEPROM
//
//  Write, followed by a 16 bits address and some data bytes :
//          Used to write given data at given address
class EepromHandler : public Handler {
 public:
  explicit EepromHandler(I2Ceeprom *eeprom) : eeprom_(eeprom){};
  ErrorCode Process(Context *context) override;

  enum class Subcommand : uint8_t {
    Read = 0x00,
    Write = 0x01,
  };

 private:
  ErrorCode Read(uint16_t address, Context *context);
  ErrorCode Write(uint16_t address, Context *context);

  static constexpr uint16_t MaxWriteLength{1024};
  I2Ceeprom *eeprom_;
};

}  // namespace Debug::Command
