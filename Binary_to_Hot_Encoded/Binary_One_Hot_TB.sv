// Testbench for the Binary to One-Hot Encoder
// This testbench tests the Binary_One_Hot module with random binary inputs
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/wKem

module Binary_One_Hot_Tb #(
    parameter BINARY = 4,       // Width of the binary input
    parameter ONE_HOT = 16      // Width of the one-hot output
) ();

    logic [BINARY-1:0] bin_i;        // Binary input for the testbench
    logic [ONE_HOT-1:0] one_hot_o;   // One-hot output from the DUT

    // Instantiate the Binary_One_Hot module
    Binary_One_Hot dut(
                    .Bin_I(bin_i),
                    .One_Hot_O(one_hot_o)
    );

    // Initial block to run the test sequence
    initial
    begin
        $dumpfile("Binary_to_One_Hot.vcd"); // Specify the output file for waveform viewing
        $dumpvars(0, Binary_One_Hot_Tb);    // Dump all variables in the testbench

        // Apply random binary inputs to the DUT and observe the one-hot output
        for (int i = 0; i < 10; ++i) begin
            bin_i = $urandom_range(0, 16);   // Generate a random binary value between 0 and 16
            #10;                            // Wait for 10 time units
        end
    end

endmodule
