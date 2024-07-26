// Testbench for the Edge Detector
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/X3kS

// Testbench module for the Edge_Detector module
module Edge_Detector_Tb();

  // Declare logic signals for the inputs and outputs of the DUT (Device Under Test)
  logic a;              // 1-bit input signal for edge detection
  logic clk;            // Clock signal for the Edge_Detector
  logic rst_l;          // Active-low reset signal for the Edge_Detector
  logic rising_edge;   // Output signal indicating a rising edge
  logic falling_edge;  // Output signal indicating a falling edge

  // Instantiate the Edge_Detector module (DUT)
  Edge_Detector dut(
    .A(a),              // Connect testbench signal 'a' to Edge_Detector input 'A'
    .Clk(clk),          // Connect testbench signal 'clk' to Edge_Detector input 'Clk'
    .Rst_l(rst_l),      // Connect testbench signal 'rst_l' to Edge_Detector input 'Rst_l'
    .Rising_Edge(rising_edge),  // Connect Edge_Detector output 'Rising_Edge' to testbench signal 'rising_edge'
    .Falling_Edge(falling_edge) // Connect Edge_Detector output 'Falling_Edge' to testbench signal 'falling_edge'
  );

  // Initial block for clock generation
  initial begin
    clk = 0;              // Initialize clock to 0
    forever begin
      #5 clk = ~clk;      // Toggle clock every 5 time units
    end
  end

  // Initial block to apply stimulus and monitor the results
  initial begin
    // Open a VCD file to dump simulation waveforms
    $dumpfile("Edge_Detector.vcd");
    // Dump all variables from the testbench and DUT
    $dumpvars(0, Edge_Detector_Tb);
    
    // Apply reset initially
    rst_l = 0;           // Apply active-low reset
    #10;                 // Wait for 10 time units
    rst_l = 1;           // Release reset
    
    // Generate random test patterns for 'a'
    for (int i = 0; i < 10; i++) begin
      a = $urandom % 2;   // Assign random 1-bit values to 'a'
      #10;               // Wait for 10 time units for each test pattern
    end
    
    // End the simulation
    $finish();
  end

endmodule
