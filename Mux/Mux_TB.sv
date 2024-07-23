// Testbench module for the 4-bit multiplexer
module Mux_Tb();

  // Declare logic signals for the inputs and outputs of the DUT (Device Under Test)
  logic [3:0] a;    // 4-bit input A for the multiplexer
  logic [3:0] b;    // 4-bit input B for the multiplexer
  logic sel;        // 1-bit select signal for the multiplexer
  logic [3:0] c;    // 4-bit output C from the multiplexer

  // Instantiate the multiplexer module (DUT)
  Mux dut(
    .A(a),   // Connect testbench signal a to multiplexer input A
    .B(b),   // Connect testbench signal b to multiplexer input B
    .Sel(sel), // Connect testbench signal sel to multiplexer input Sel
    .C(c)    // Connect testbench signal c to multiplexer output C
  );

  // Initial block to apply stimulus and monitor the results
  initial begin
    // Open a VCD file to dump simulation waveforms
    $dumpfile("Mux.vcd");
    // Dump all variables from the testbench and DUT
    $dumpvars(0, Mux_Tb);
    
    // Generate random test patterns for a, b, and sel
    for (int i = 0; i < 10; i++) begin
      // Assign random values to a and b in the range 0 to 255
      a = $urandom_range(0, 8'hFF);
      b = $urandom_range(0, 8'hFF);
      // Assign random value 0 or 1 to sel
      sel = $urandom % 2;
      // Wait for 5 time units
      #5;
    end
    
    // End the simulation
    $finish();
  end

endmodule
