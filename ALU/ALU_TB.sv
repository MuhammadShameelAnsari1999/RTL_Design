// Testbench module for the ALU with various operations
module ALU_Tb ();

  // Declare logic signals for the inputs and outputs of the DUT (Device Under Test)
  logic [31:0] a, b;                 // 32-bit inputs A and B
  logic [2:0] alucontrol;            // 3-bit control signal for the ALU
  logic carry, zero, negative, overflow;  // Flags for the ALU operation
  logic [31:0] results;              // 32-bit result from the ALU

  // Instantiate the ALU module (DUT)
  ALU dut (
    .A(a), 
    .B(b), 
    .ALUControl(alucontrol), 
    .Carry(carry), 
    .Negative(negative), 
    .Overflow(overflow), 
    .Zero(zero), 
    .ALUResult(results) // Corrected port name
  );

  // Initial block to apply stimulus and monitor the results
  initial begin
    // Open a VCD file to dump simulation waveforms
    $dumpfile("ALU.vcd");
    // Dump all variables from the testbench and DUT
    $dumpvars(0, ALU_Tb);
    
    // Generate random test patterns for 'a', 'b', and 'alucontrol'
    for (int i = 0; i < 10; i++) begin
      a = $urandom_range(0, 32'h3F);  // Assign random 32-bit values to 'a'
      b = $urandom_range(0, 32'h3F);  // Assign random 32-bit values to 'b'
      alucontrol = $urandom_range(0, 8);    // Assign random 3-bit values to 'alucontrol'
      #10;                                  // Wait for 10 time units for each test pattern
    end
    
    // End the simulation
    $finish();
  end

endmodule
