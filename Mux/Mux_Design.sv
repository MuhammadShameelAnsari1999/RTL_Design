// Design for a Mux
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/b9fm

// Module definition for a 4-bit multiplexer
module Mux(A, B, Sel, C);
  
  // Port declarations
  input logic [3:0] A;  // 4-bit input A
  input logic [3:0] B;  // 4-bit input B
  input logic Sel;      // 1-bit select signal
  output logic [3:0] C; // 4-bit output C
  
  // Always_comb block for combinational logic
  always_comb begin
    // If Sel is 1, assign B to C; otherwise, assign A to C
    C = Sel ? B : A;
  end
endmodule
