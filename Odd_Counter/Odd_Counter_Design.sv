// Design for a Odd Counter
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/MbTz

module Odd_Counter(
    input Clk, Rst_l,       // Clock and active-low reset inputs
    output logic [31:0] Count // 32-bit counter output
);

    // Always block triggered on the rising edge of Clk or falling edge of Rst_l
    always_ff @ (posedge Clk or negedge Rst_l) begin
        if (~Rst_l)
          Count <= 32'h1; // Set Count to 1 on reset
        else
            Count <= Count + 2'h2; // Increment Count by 2 on each clock cycle
    end
endmodule
