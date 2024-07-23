// Module definition for a 4-bit synchronous D Flip-Flop with synchronous and asynchronous reset
module D_Flip_Flop(Clk, Rst_l, D, Q_no_rst, Q_sync, Q_async);

  // Port declarations
  input logic [3:0] D;          // 4-bit data input
  input logic Clk;              // Clock input
  input logic Rst_l;            // Active-low reset input
  output logic [3:0] Q_no_rst;  // 4-bit data output without reset
  output logic [3:0] Q_sync;    // 4-bit data output with synchronous reset
  output logic [3:0] Q_async;   // 4-bit data output with asynchronous reset

  // Always block triggered on the positive edge of the clock signal or the negative edge of Rst_l
  // This block implements an asynchronous reset
  always_ff @(posedge Clk or negedge Rst_l) begin
    if (~Rst_l)
      Q_async <= 4'h0; // If reset is active (low), set Q_async to 0 (asynchronous reset)
    else
      Q_async <= D;    // Otherwise, transfer the value of D to Q_async
  end

  // Always block triggered on the positive edge of the clock signal
  // This block implements a synchronous reset
  always_ff @(posedge Clk) begin
    if (~Rst_l)
      Q_sync <= 4'h0; // If reset is active (low), set Q_sync to 0 (synchronous reset)
    else
      Q_sync <= D;    // Otherwise, transfer the value of D to Q_sync
  end

  // Always block triggered on the positive edge of the clock signal
  // This block does not have a reset
  always_ff @(posedge Clk) begin
    Q_no_rst <= D;    // Transfer the value of D to Q_no_rst on every positive clock edge
  end

endmodule
