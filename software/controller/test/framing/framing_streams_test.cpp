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

#include "framing_streams.h"

#include "gtest/gtest.h"
#include "mock_uart_dma.h"
#include "uart_dma_stream.h"

class ObserverStream : public OutputStream {
  static constexpr size_t StreamLength = 20;
  size_t i = 0;
  int32_t saved[StreamLength];

 public:
  StreamResponse put(int32_t b) override {
    if (EndOfStream == b) {
      return {};
    }

    if (i < StreamLength) {
      saved[i++] = b;
      return StreamResponse(1, ResponseFlags::StreamSuccess);
    } else {
      return StreamResponse(0, ResponseFlags::ErrorBufferFull);
    }
  }
  // Returns number of bytes of encoded frame after processing the given byte.
  size_t encoded_length(int32_t b) { return EndOfStream == b ? 0 : 1; }
  // Returns number of bytes that can be written.
  size_t bytes_available_for_write() override { return StreamLength - i; }
  int32_t *get_saved() { return saved; }
  size_t get_index() { return i; }
};

TEST(StreamResponse, StreamResponseSum) {
  StreamResponse r1{42, ResponseFlags::StreamSuccess};
  StreamResponse r2{52, ResponseFlags::StreamSuccess};
  r2 += r1;
  ASSERT_EQ(r2.count_written_, 42 + 52);
}

TEST(FramingStreamsTests, CrcStreamTrivial) {
  ObserverStream observer;
  CrcStream crc_stream(observer);

  crc_stream.put(0);
  ASSERT_EQ(observer.get_index(), 1);
  ASSERT_EQ(crc_stream.put(EndOfStream).count_written_, 4);
  ASSERT_EQ(observer.get_index(), 5);
}

TEST(FramingStreamsTests, EscapeStreamTrivial) {
  ObserverStream observer;
  EscapeStream escape_stream(observer);
  EXPECT_EQ(escape_stream.put(EndOfStream).count_written_, 2);
  EXPECT_EQ(escape_stream.put(0).count_written_, 2);
  EXPECT_EQ(escape_stream.put(0).count_written_, 1);
  EXPECT_EQ(escape_stream.put(FramingMark).count_written_, 2);
  EXPECT_EQ(escape_stream.put(FramingEscape).count_written_, 2);
  EXPECT_EQ(escape_stream.put(EndOfStream).count_written_, 1);
}

TEST(FramingStreamsTests, DmaStreamTrivial) {
  MockUartDma mock_uart_dma;
  DmaStream<2> dma_stream{&mock_uart_dma};
  StreamResponse r;
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 4);

  r = dma_stream.put(0);
  EXPECT_EQ(r.count_written_, 1);
  EXPECT_EQ(r.flags_, static_cast<uint32_t>(ResponseFlags::StreamSuccess));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 3);
  EXPECT_FALSE(mock_uart_dma.tx_in_progress());

  r = dma_stream.put(0);
  EXPECT_EQ(r.count_written_, 1);
  EXPECT_EQ(r.flags_, static_cast<uint32_t>(ResponseFlags::StreamSuccess));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 2);
  EXPECT_TRUE((mock_uart_dma.tx_in_progress()));

  r = dma_stream.put(0);
  EXPECT_EQ(r.count_written_, 1);
  EXPECT_EQ(r.flags_, static_cast<uint32_t>(ResponseFlags::StreamSuccess));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 1);

  r = dma_stream.put(0);
  EXPECT_EQ(r.count_written_, 1);
  EXPECT_EQ(r.flags_, static_cast<uint32_t>(ResponseFlags::WarningBufferFull));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 0);

  r = dma_stream.put(0);
  EXPECT_EQ(r.count_written_, 0);
  EXPECT_EQ(r.flags_, static_cast<uint32_t>(ResponseFlags::ErrorBufferFull));

  mock_uart_dma.DMA_tx_interrupt_handler();
  EXPECT_TRUE((mock_uart_dma.tx_in_progress()));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 2);
  mock_uart_dma.DMA_tx_interrupt_handler();
  EXPECT_FALSE((mock_uart_dma.tx_in_progress()));
  EXPECT_EQ(dma_stream.bytes_available_for_write(), 4);
}

TEST(FramingStreamsTests, FullStackTrivial) {
  MockUartDma mock_uart_dma;
  DmaStream<20> dma_stream{&mock_uart_dma};
  EscapeStream esc_stream(dma_stream);
  CrcStream crc_stream(esc_stream);

  StreamResponse r;

  r = crc_stream.put(0x41);
  // begin frame marker and the '1'
  ASSERT_EQ(r.count_written_, 2);
  r = crc_stream.put(0x42);
  ASSERT_EQ(r.count_written_, 1);
  r = crc_stream.put(EndOfStream);
  // 4 bytes crc and end marker
  ASSERT_EQ(r.count_written_, 5);
}
