// Design for a Binary to Gray Converter
// This module converts a binary input into a Gray Code output
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/ukQ4

module Binary_Gray #(
    parameter WIDTH = 4       // Width of the binary input
) (
    input [WIDTH-1:0] Bin_I,   // Binary input
    output [WIDTH-1:0] Gray_O // Gray Code output
);

    // Combinational logic to convert binary input to Gray Code output
    // Method 1
    //assign Gray_O = Bin_I ^ (Bin_I >> 1);

    // Combinational logic to convert binary input to Gray Code output
    // Method 2
    // The most significant bit (MSB) of Gray code is the same as the MSB of the binary input
    assign Gray_O[WIDTH-1] = Bin_I[WIDTH-1];

    // Generate block to create the Gray code for the remaining bits
    genvar i;
    generate
        for (i = WIDTH-2; i >= 0; i = i-1) begin : gen_gray
            assign Gray_O[i] = Bin_I[i+1] ^ Bin_I[i];
        end
    endgenerate
  
endmodule
