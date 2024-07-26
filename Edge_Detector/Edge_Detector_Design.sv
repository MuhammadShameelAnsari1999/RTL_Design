// Design for an Edge Detector
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/X3kS

// Module definition for edge detection with synchronous clocking and asynchronous reset
module Edge_Detector(
  input logic Clk,          // Clock input
  input logic Rst_l,        // Active-low reset input
  input logic A,            // Data input
  output logic Rising_Edge, // Output signal indicating a rising edge
  output logic Falling_Edge // Output signal indicating a falling edge
);

  logic prev_A;             // Internal register to hold the previous state of A

  // Always block for synchronous edge detection and asynchronous reset
  always_ff @(posedge Clk or negedge Rst_l) begin
    if (~Rst_l) begin
      // Asynchronous reset logic
      Rising_Edge <= 1'h0;      // Reset Rising_Edge output to 0
      Falling_Edge <= 1'h0;     // Reset Falling_Edge output to 0
      prev_A <= 1'h0;           // Reset previous state of A to 0
    end else begin
      // Update previous state of A
      prev_A <= A;
      // Detect rising edge: previous state was 0 and current state is 1
      Rising_Edge <= (~prev_A & A);
      // Detect falling edge: previous state was 1 and current state is 0
      Falling_Edge <= (prev_A & ~A);
    end
  end

endmodule
