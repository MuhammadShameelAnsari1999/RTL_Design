// Design for a 4-bit Linear Feedback Shift Register (LFSR)
// An LFSR is a shift register whose input bit is a linear function of its previous state. The most commonly used linear function of single bits is XOR.
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/S9_q

// Module definition for a 4-bit LFSR
module LFSR(Clk, Rst_l, Out);
    input Clk, Rst_l;           // Clock and Reset (active low) inputs
    output [3:0] Out;           // 4-bit output

    logic [3:0] Out_Reg;        // Internal register for holding the LFSR value

    // Sequential logic to update the LFSR on the rising edge of the clock or reset the register on reset
    always_ff @(posedge Clk or negedge Rst_l) begin
        if (~Rst_l)    
            Out_Reg <= 4'h8;    // Initialize LFSR value to 8 on reset
        else begin
            // Update LFSR value based on XOR feedback
            Out_Reg[0] <= Out_Reg[1] ^ Out_Reg[3];
            Out_Reg[1] <= Out_Reg[0];
            Out_Reg[2] <= Out_Reg[1];
            Out_Reg[3] <= Out_Reg[2];
        end
    end

    // Assign the output to the internal LFSR register value
    assign Out = Out_Reg;

endmodule
