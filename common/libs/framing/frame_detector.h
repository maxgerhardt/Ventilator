#ifndef __FRAME_DETECTOR__
#define __FRAME_DETECTOR__

#include "serial_listeners.h"
#include <stdint.h>
#include <string.h>

template <class RxBuffer, int FRAME_BUF_LEN>
class FrameDetector : public RxListener {
public:
  enum class State {
    LOST,       // Frame detector does not know where it is in the stream of
                // bytes coming into RxBuffer
    WAIT_START, // Frame detector for a frame start marker
    RX_FRAME    // Frame detector is receiving a frame
  };

  FrameDetector(RxBuffer &t) : rx_buffer_(t){};
  void Begin() {
    state_ = State::LOST;
    rx_buffer_.Begin(this);
  }

  void onRxComplete() override {
    // We should never reach the full read of rx buffer.
    // If we get here, this means, there are no marker
    // chars in the stream, so we are lost
    error_counter_++;
    state_ = State::LOST;
    rx_buffer_.RestartRX(this);
  }

  void onCharacterMatch() override {
    switch (state_) {
    case State::LOST:
      // if we have received something before this marker,
      // we assume, this is the frame end marker, so wait
      // for start
      if (rx_buffer_.ReceivedLength() > 1) {
        state_ = State::WAIT_START;
        // printf("\nLOST > WAIT_START\n");
        // if we were lucky to get lost in the interframe silence,
        // assume this is the start of the frame
      } else if (rx_buffer_.ReceivedLength() == 1) {
        state_ = State::RX_FRAME;
        // printf("\nLOST > RX_FRAME\n");
      } else {
        // printf("!!!! DMA not working!");
        // TODO alert, safe reset
        // Should never end up here
        // DMA is not working?
      }
      break;
    case State::WAIT_START:
      if (rx_buffer_.ReceivedLength() == 1) {
        // printf("\nWAIT_START > RX_FRAME\n");
        state_ = State::RX_FRAME;
      } else {
        // some junk received while waiting for start marker,
        // but should have been just silence
        error_counter_++;
        state_ = State::LOST;
        // printf("! JUNK ! %d", rx_buffer_.ReceivedLength());
        // printf("\nWAIT_START > LOST\n");
      }
      break;
    case State::RX_FRAME:
      // end marker received, check if we got something
      if (rx_buffer_.ReceivedLength() > 1) {
        processReceivedData();
        // printf("\nRX_FRAME > WAIT_START\n");
        state_ = State::WAIT_START;
      } else {
        // printf("! REPEAT MARK");
        // repeated marker char received
        // assume we are still good
      }
      break;
    }
    rx_buffer_.RestartRX(this);
  }

  void onRxError(RxError_t e) override {
    switch (state_) {
    case State::LOST:
    case State::WAIT_START:
      // no change
      break;
    case State::RX_FRAME:
      state_ = State::LOST;
      break;
    }
    error_counter_++;
  }

  uint8_t *get_frame_buf() {
    frame_available_ = false;
    return frame_buf_;
  }

  uint32_t get_frame_length() { return frame_buf_length_; }
  bool is_frame_available() { return frame_available_; }

#ifdef TEST_MODE
  State get_state() { return state_; }
#endif

private:
  RxBuffer &rx_buffer_;
  State state_ = State::LOST;
  uint32_t error_counter_ = 0;
  bool frame_available_ = false;
  uint8_t frame_buf_[FRAME_BUF_LEN];
  uint32_t frame_buf_length_ = 0;

  void processReceivedData() {
    // we strip markers from the stream, but that does not influence the frame
    // decoder code
    frame_buf_length_ = rx_buffer_.ReceivedLength() - 1;
    memcpy(frame_buf_, rx_buffer_.get(), frame_buf_length_);
    frame_available_ = true;
  }
};

#endif
