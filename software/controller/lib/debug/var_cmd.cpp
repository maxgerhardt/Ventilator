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

#include "commands.h"
#include "vars.h"
#include <stdint.h>
#include <string.h>

namespace Debug::Command {

ErrorCode VarHandler::Process(Context *context,
                              flatbuffers::FlatBufferBuilder &b) {

  const DebugFlatbuf::Request *req{
      flatbuffers::GetRoot<DebugFlatbuf::Request>(context->request)};
  const DebugFlatbuf::VarAccessData *cmddata{req->cmddata_as_VarAccessData()};

  // We expect a sub-command.
  if (flatbuffers::IsFieldPresent(cmddata,
                                  DebugFlatbuf::VarAccessData::VT_SUBCMD))
    return ErrorCode::MissingData;

  DebugFlatbuf::VarSubcmd subcommand{cmddata->subcmd()};

  switch (subcommand) {
  // Return info about one of the variables.
  case DebugFlatbuf::VarSubcmd::GetInfo:
    return GetVarInfo(context, b);

  case DebugFlatbuf::VarSubcmd::Get:
    return GetVar(context, b);

  case DebugFlatbuf::VarSubcmd::Set:
    return SetVar(context, b);

  case DebugFlatbuf::VarSubcmd::GetCount:
    return GetVarCount(context);

  default:
    return ErrorCode::InvalidData;
  }
}

// Return info about one of the variables.
// The 16-bit variable ID is passed in.  These IDs are
// automatically assigned as variables are registered in the
// system starting with 0.  The Python code can read them
// all out until it gets an error code indicating that the
// passed ID is invalid.
ErrorCode VarHandler::GetVarInfo(Context *context,
                                 flatbuffers::FlatBufferBuilder &b) {

  const DebugFlatbuf::Request *req{
      flatbuffers::GetRoot<DebugFlatbuf::Request>(context->request)};
  const DebugFlatbuf::VarAccessData *cmddata{req->cmddata_as_VarAccessData()};

  // We expect a 16-bit ID to be passed
  if (flatbuffers::IsFieldPresent(cmddata, DebugFlatbuf::VarAccessData::VT_VID))
    return ErrorCode::MissingData;

  uint16_t var_id{cmddata->vid()};

  const auto *var = DebugVar::FindVar(var_id);
  if (!var)
    return ErrorCode::UnknownVariable;

  // The info I return consists of the following:
  // <type> - 1 byte variable type code
  // <access> - 1 byte gives the possible access to that variable (read only?)
  // <reserved> - 2 reserved bytes for things we think of later
  // <name> - variable length name string
  // <fmt>  - variable length format string
  // <help> - variable length help string
  // <unit> - variable length unit string
  // The strings are not null terminated.

  auto res = DebugFlatbuf::CreateGetVarInfo(
      b, static_cast<uint8_t>(var->GetAccess()), b.CreateString(var->GetName()),
      b.CreateString(var->GetFormat()), b.CreateString(var->GetHelp()),
      b.CreateString(var->GetUnits()));
  b.Finish(res);
  uint8_t *buff = b.GetBufferPointer();
  uint32_t buff_size = b.GetSize();
  b.Clear();

  // Fail if the strings are too large to fit.
  if (context->max_response_length < buff_size)
    return ErrorCode::NoMemory;

  context->response = buff;
  *(context->processed) = true;
  return ErrorCode::None;
}

ErrorCode VarHandler::GetVar(Context *context,
                             flatbuffers::FlatBufferBuilder &b) {
  // We expect a 16-bit ID to be passed
  if (context->request_length < 3)
    return ErrorCode::MissingData;

  uint16_t var_id = u8_to_u16(&context->request[1]);

  auto *var = DebugVar::FindVar(var_id);
  if (!var)
    return ErrorCode::UnknownVariable;

  if (context->max_response_length < 4)
    return ErrorCode::NoMemory;

  u32_to_u8(var->GetValue(), context->response);
  context->response_length = 4;
  *(context->processed) = true;
  return ErrorCode::None;
}

ErrorCode VarHandler::SetVar(Context *context,
                             flatbuffers::FlatBufferBuilder &b) {
  // We expect a 16-bit ID to be passed
  if (context->request_length < 3)
    return ErrorCode::MissingData;

  uint16_t var_id = u8_to_u16(&context->request[1]);

  auto *var = DebugVar::FindVar(var_id);
  if (!var)
    return ErrorCode::UnknownVariable;

  uint32_t count = context->request_length - 3;

  if (count < 4)
    return ErrorCode::MissingData;

  if (!var->WriteAllowed())
    return ErrorCode::InternalError;

  var->SetValue(u8_to_u32(context->request + 3));
  context->response_length = 0;
  *(context->processed) = true;
  return ErrorCode::None;
}

ErrorCode VarHandler::GetVarCount(Context *context) {
  if (context->max_response_length < 4)
    return ErrorCode::NoMemory;

  u32_to_u8(DebugVarBase::GetVarCount(), context->response);
  context->response_length = 4;
  *(context->processed) = true;
  return ErrorCode::None;
}

} // namespace Debug::Command
