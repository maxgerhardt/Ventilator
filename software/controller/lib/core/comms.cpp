#include "comms.h"

#include <pb_common.h>
#include <pb_decode.h>
#include <pb_encode.h>

#include <optional>

#include "hal.h"
#include "system_timer.h"

// Our outgoing (serialized) ControllerStatus proto is stored in tx_buffer.  We
// then transmit it a few bytes at a time, as the serial port becomes
// available.
//
// This isn't a circular buffer; the beginning of the proto is always at the
// beginning of the buffer.
static uint8_t tx_buffer[ControllerStatus_size];
// Index of the next byte to transmit.
static uint16_t tx_idx = 0;
// Number of bytes remaining to transmit. tx_idx + tx_bytes_remaining equals
// the size of the serialized ControllerStatus proto.
static uint16_t tx_bytes_remaining = 0;

// Time when we started sending the last ControllerStatus.
static std::optional<Time> last_tx;

// Our incoming (serialized) GuiStatus proto is incrementally buffered in
// rx_buffer until it's complete and we can deserialize it to a proto.
//
// Like tx_buffer, this isn't a circular buffer; the beginning of the proto is
// always at the beginning of the buffer.
static uint8_t rx_buffer[GuiStatus_size];
static uint16_t rx_idx = 0;
static Time last_rx = SystemTimer::singleton().now();
static bool rx_in_progress = false;

// We currently lack proper message framing, so we use a timeout to determine
// when the GUI is done sending us its message.
static constexpr Duration RxTimeout = milliseconds(1);

// We send a ControllerStatus every TX_INTERVAL_MS.

// In Alpha build we use synchronized communication initiated by GUI cycle
// controller. Since both ControllerStatus and GuiStatus take roughly 300+
// bytes, we need at least 1/115200.*10*300=26ms to transmit.
static constexpr Duration TxInterval = milliseconds(30);

void CommsInit() {}

static bool IsTimeToProcessPacket() { return SystemTimer::singleton().now() - last_rx > RxTimeout; }

// NOTE this is work in progress.
// Proper framing incomming. Afproto will be used to encode data to form that
// can be safely sent over wire - with packet start/end markers and CRC

// TODO add frame markers
// TODO add marker escaping in contents
// TODO add CRC to whole packet

// TODO run this via DMA to free up resources for control loops
static void ProcessTx(const ControllerStatus &controller_status) {
  auto bytes_avail = hal.SerialBytesAvailableForWrite();
  if (bytes_avail == 0) {
    return;
  }

  // Serialize our current state into the buffer if
  //  - we're not currently transmitting,
  //  - we can transmit at least one byte now, and
  //  - it's been a while since we last transmitted.
  if (tx_bytes_remaining == 0 &&
      (last_tx == std::nullopt || SystemTimer::singleton().now() - *last_tx > TxInterval)) {
    // Serialize current status into output buffer.
    //
    // TODO: Frame the message bytes.
    // TODO: Add a checksum to the message.
    pb_ostream_t stream = pb_ostream_from_buffer(tx_buffer, sizeof(tx_buffer));
    if (!pb_encode(&stream, ControllerStatus_fields, &controller_status)) {
      // TODO: Serialization failure; log an error or raise an alert.
      return;
    }
    tx_idx = 0;
    tx_bytes_remaining = static_cast<uint16_t>(stream.bytes_written);
    last_tx = SystemTimer::singleton().now();
  }

  // TODO: Alarm if we haven't been able to send a status in a certain amount
  // of time.

  // Send bytes over the wire if any are in our buffer.
  if (tx_bytes_remaining > 0) {
    // TODO(jlebar): Change SerialWrite to take a uint8* instead of a char*, so
    // it matches nanopb.
    uint16_t bytes_written = hal.SerialWrite(reinterpret_cast<char *>(tx_buffer) + tx_idx,
                                             std::min(bytes_avail, tx_bytes_remaining));
    // TODO: How paranoid should we be about this underflowing?  Perhaps we
    // should reset the device if this or other invariants are violated?
    tx_bytes_remaining = static_cast<uint16_t>(tx_bytes_remaining - bytes_written);
    tx_idx = static_cast<uint16_t>(tx_idx + bytes_written);
  }
}

static void ProcessRx(GuiStatus *gui_status) {
  while (hal.SerialBytesAvailableForRead() > 0) {
    rx_in_progress = true;
    char b;
    uint16_t bytes_read = hal.SerialRead(&b, 1);
    if (bytes_read == 1) {
      rx_buffer[rx_idx++] = (uint8_t)b;
      if (rx_idx >= sizeof(rx_buffer)) {
        rx_idx = 0;
        break;
      }
      last_rx = SystemTimer::singleton().now();
    }
  }

  // TODO do away with timeout-based reception once we have framing in place,
  // but it will work for Alpha build for now
  if (rx_in_progress && IsTimeToProcessPacket()) {
    pb_istream_t stream = pb_istream_from_buffer(rx_buffer, rx_idx);
    GuiStatus new_gui_status = GuiStatus_init_zero;
    if (pb_decode(&stream, GuiStatus_fields, &new_gui_status)) {
      *gui_status = new_gui_status;
    } else {
      // TODO: Log an error.
    }
    rx_idx = 0;
    rx_in_progress = false;
  }
}

void CommsHandler(const ControllerStatus &controller_status, GuiStatus *gui_status) {
  ProcessTx(controller_status);
  ProcessRx(gui_status);
}
