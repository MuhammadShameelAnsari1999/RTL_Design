// Design for a Binary to One-Hot Encoder
// This module converts a 4-bit binary input into a 16-bit one-hot output
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/wKem

module Binary_One_Hot #(
    parameter BINARY = 4,       // Width of the binary input
    parameter ONE_HOT = 16      // Width of the one-hot output
) (
    input [BINARY-1:0] Bin_I,   // Binary input
    output [ONE_HOT-1:0] One_Hot_O // One-hot output
);

    // Combinational logic to convert binary input to one-hot output
    assign One_Hot_O = 1'h1 << Bin_I;

endmodule
