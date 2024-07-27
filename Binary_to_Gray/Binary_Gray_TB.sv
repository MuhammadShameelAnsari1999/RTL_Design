// Testbench for the Binary to Gray Converter
// This testbench tests the Binary_Gray module with sequential binary inputs
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/ukQ4

module Binary_Gray_Tb;

    parameter WIDTH = 4;       // Width of the binary input

    logic [WIDTH-1:0] bin_i;        // Binary input for the testbench
    logic [WIDTH-1:0] gray_o;       // Gray Code output from the DUT

    // Instantiate the Binary_Gray module
    Binary_Gray #(WIDTH) dut (
        .Bin_I(bin_i),
        .Gray_O(gray_o)
    );

    // Initial block to run the test sequence
    initial begin
        $dumpfile("Binary_to_Gray.vcd"); // Specify the output file for waveform viewing
        $dumpvars(0, Binary_Gray_Tb);    // Dump all variables in the testbench

        // Apply sequential binary inputs to the DUT and observe the Gray Code output
        for (int i = 0; i < (1 << WIDTH); ++i) begin
            bin_i = i;   // Generate a sequential binary value
            #10;         // Wait for 10 time units
            $display("Binary = %0d, Gray = %0d", bin_i, gray_o); // Display binary and gray values
        end
        
        #10; // Additional delay to observe the last value
        $finish(); // End the simulation
    end

endmodule
