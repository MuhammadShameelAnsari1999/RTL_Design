// Design for a Parallel-In Serial-Out (PISO) Shift Register
// This module implements a shift register that can load parallel data and 
// then shift it out serially. When the Shift_LD signal is high, the data 
// will be shifted. When Shift_LD is low, the parallel data will be loaded.

// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/kF2P

module PISO #(
    parameter WIDTH = 4  // Width of the shift register
) (
    input Clk,             // Clock input
    input Rst_l,           // Active low reset input
    input Shift_LD,        // Shift/load control signal
    input [WIDTH-1:0] Parallel_In, // Parallel input data
    output Empty_Flag,     // Flag to indicate if the shift register is empty
    output Serial_Out,     // Serial output data
    output Valid_O         // Flag to indicate if there is valid data to shift
);

    logic serial_out_ff;    // Flip-flop to hold the serial output
    logic [WIDTH-1:0] load_data; // Register to hold the parallel data

    // Sequential block to handle reset and shifting/loading data
    always_ff @(posedge Clk or negedge Rst_l) 
        begin
            if (~Rst_l) 
                begin
                    serial_out_ff <= 1'b0;  // Clear the serial output
                    load_data <= 4'h0;      // Clear the load data register
                end 
            else 
                begin
                    if (Shift_LD) 
                        begin
                            // When Shift_LD is high, shift the data
                            serial_out_ff <= load_data[WIDTH-1]; // Shift the MSB to the serial output
                            load_data <= load_data << 1;         // Shift the load data left by 1 bit
                        end 
                    else 
                        begin
                            // When Shift_LD is low, load the parallel input data
                            load_data <= Parallel_In;            // Load the parallel input data
                        end
                end
        end

    // Combinational assignments for outputs
    assign Serial_Out = serial_out_ff;                      // Assign serial output
    assign Empty_Flag = (load_data == 4'h0);                // Set empty flag if load data is zero
    assign Valid_O = (|load_data);                          // Set valid flag if any bit in load data is 1
    
endmodule
