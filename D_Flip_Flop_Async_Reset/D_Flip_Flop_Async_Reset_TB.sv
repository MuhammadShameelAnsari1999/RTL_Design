// Testbench module for the 4-bit Asynchronous D Flip-Flop
module D_Flip_Flop_Tb();

  // Declare logic signals for the inputs and outputs of the DUT (Device Under Test)
  logic [3:0] d;    // 4-bit input D for the D Flip-Flop
  logic clk;        // Clock signal for the D Flip-Flop
  logic rst_l;      // Active-low reset signal for the D Flip-Flop
  logic [3:0] q;    // 4-bit output Q from the D Flip-Flop

  // Instantiate the D Flip-Flop module (DUT)
  D_Flip_Flop dut(
    .D(d),        // Connect testbench signal d to D Flip-Flop input D
    .Clk(clk),    // Connect testbench signal clk to D Flip-Flop input Clk
    .Rst_l(rst_l),// Connect testbench signal rst_l to D Flip-Flop input Rst_l
    .Q(q)         // Connect testbench signal q to D Flip-Flop output Q
  );

  // Initial block for clock generation
  initial begin
    clk = 0;      // Initialize clock to 0
    forever begin
      #5 clk = ~clk; // Toggle clock every 5 time units
    end
  end

  // Initial block to apply stimulus and monitor the results
  initial begin
    // Open a VCD file to dump simulation waveforms
    $dumpfile("D_Flip_Flop.vcd");
    // Dump all variables from the testbench and DUT
    $dumpvars(0, D_Flip_Flop_Tb);
    
    // Apply reset initially
    rst_l = 0;
    #10;
    rst_l = 1;   // Release reset after 10 time units

    // Generate random test patterns for d
    for (int i = 0; i < 10; i++) begin
      d = $urandom_range(0, 4'hF); // Assign random 4-bit values to d
      #10;                         // Wait for 10 time units for each test pattern
    end
    
    // End the simulation
    $finish();
  end

endmodule
