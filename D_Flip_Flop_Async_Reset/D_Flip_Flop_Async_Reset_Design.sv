// Module definition for a 4-bit Asynchronous D Flip-Flop with Asynchronous reset
module D_Flip_Flop(Clk, Rst_l, D, Q);

  // Port declarations
  input logic [3:0] D;  // 4-bit data input
  input logic Clk;      // Clock input
  input logic Rst_l;    // Active-low reset input
  output logic [3:0] Q; // 4-bit data output

  // Always block triggered on the positive edge of the clock signal
  // This block implements a Asynchronous reset
  always @(posedge Clk or Negedge Rst_l) begin
    if (~Rst_l)
      Q <= 4'h0; // If reset is active (low), set Q to 0 (Asynchronous reset)
    else
      Q <= D;    // Otherwise, transfer the value of D to Q
  end
endmodule
