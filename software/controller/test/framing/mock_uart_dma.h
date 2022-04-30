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

#pragma once

#include <cstring>  // in order to use memcpy

#include "uart_dma.h"

class MockUartDma : public UartDma {
 public:
  MockUartDma() = default;
  uint8_t tx_buffer_[200] = {0};
  size_t tx_length_{0};

  bool start_tx(uint8_t *buffer, size_t length, TxListener *txl) override {
    memcpy(tx_buffer_, buffer, length);
    tx_length_ = length;
    tx_in_progress_ = true;
    tx_listener_ = txl;
    printf("TX event, length: %u\n ", static_cast<int>(tx_length_));
    for (size_t i = 0; i < length; i++) {
      printf("%X ", buffer[i]);
    }
    printf("\n");
    return true;
  };

  void DMA_tx_interrupt_handler() override {
    tx_in_progress_ = false;
    if (tx_listener_ != nullptr) tx_listener_->on_tx_complete();
  }
};
