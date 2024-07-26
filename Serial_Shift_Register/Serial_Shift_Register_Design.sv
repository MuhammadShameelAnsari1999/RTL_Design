module Serial_Shift_Register(
    input Clk,           // Clock input
    input Rst_l,         // Active-low reset
    input Serial_In,     // Serial input
    output [3:0] Serial_Out // 4-bit serial output
);

    logic [3:0] Serial_Out_Reg; // Internal register to hold the shift register state

    // Always block for sequential logic triggered on the rising edge of Clk or falling edge of Rst_l
    always_ff @(posedge Clk or negedge Rst_l) begin
        if (~Rst_l)
            Serial_Out_Reg <= 4'h0; // Reset the register to 0 when Rst_l is low
        else
          Serial_Out_Reg <= {Serial_Out_Reg[2:0], Serial_In}; // Shift in the Serial_In bit
    end

    // Output logic
    assign Serial_Out = Serial_Out_Reg;
    
endmodule
