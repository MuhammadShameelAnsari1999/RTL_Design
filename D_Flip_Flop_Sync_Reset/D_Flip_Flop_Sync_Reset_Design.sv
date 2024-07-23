// Module definition for a 4-bit synchronous D Flip-Flop with synchronous reset
module D_Flip_Flop(Clk, Rst_l, D, Q);

  // Port declarations
  input logic [3:0] D;  // 4-bit data input
  input logic Clk;      // Clock input
  input logic Rst_l;    // Active-low reset input
  output logic [3:0] Q; // 4-bit data output

  // Always block triggered on the positive edge of the clock signal
  // This block implements a synchronous reset
  always @(posedge Clk) begin
    if (~Rst_l)
      Q <= 4'h0; // If reset is active (low), set Q to 0 (synchronous reset)
    else
      Q <= D;    // Otherwise, transfer the value of D to Q
  end
endmodule
