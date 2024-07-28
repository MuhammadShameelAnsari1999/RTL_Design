// Design for a Load Value Counter
// This module implements a counter that resets to zero when either the reset is low or the counter reaches the load value.
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/EUVd

module Load_Value_Counter #(
    parameter WIDTH = 4  // Width of the counter and load value
) (
    input Clk,                 // Clock input
    input Rst_l,               // Active low reset input
    input Load_Value_Valid,    // Load value valid signal
    input [WIDTH-1:0] Load_Value, // Load value input
    output [WIDTH-1:0] Count   // Counter output
);

    logic [WIDTH-1:0] out;     // Internal register for the counter
    logic Load_Flag;           // Flag to indicate that the counter should load the new value

    // Always block triggered on the rising edge of the clock or the falling edge of the reset
    always_ff @(posedge Clk or negedge Rst_l) begin
        if (~Rst_l) begin
            out <= 4'h0;       // If reset is active (low), reset the counter to zero
            Load_Flag <= 1'b0; // Clear the load flag
        end else begin
            if (Load_Value_Valid)
                Load_Flag <= Load_Value_Valid; // Set the load flag if Load_Value_Valid is high
            
            if (Load_Flag & (out == (2**WIDTH-1))) begin
                out <= Load_Value; // If load flag is set and counter is at max value, load the new value
                Load_Flag <= 1'b0; // Clear the load flag after loading the value
            end else begin
                out <= out + 1'h1; // Otherwise, increment the counter
            end
        end
    end
  
    assign Count = out; // Assign the counter value to the output
    
endmodule
