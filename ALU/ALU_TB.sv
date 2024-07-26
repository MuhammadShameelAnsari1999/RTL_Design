// Testbench for both ALU modules
module ALU_Tb ();
    logic [31:0] a, b;
    logic [2:0] alucontrol;
    logic carry1, zero1, negative1, overflow1;
    logic carry2, zero2, negative2, overflow2;
    logic [31:0] results1, results2;

    // Instantiation of ALU_UsingAssign
    ALU_UsingAssign alu_assign(
        .A(a),
        .B(b),
        .ALUControl(alucontrol),
        .Carry(carry1),
        .Zero(zero1),
        .Negative(negative1),
        .Overflow(overflow1),
        .ALUResult(results1)
    );

    // Instantiation of ALU_UsingAlwaysComb
    ALU_UsingAlwaysComb alu_comb(
        .A(a),
        .B(b),
        .ALUControl(alucontrol),
        .Carry(carry2),
        .Zero(zero2),
        .Negative(negative2),
        .Overflow(overflow2),
        .ALUResult(results2)
    );

    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU_Tb);
    
        // Generate random test patterns for 'a', 'b' and 'alucontrol'
        for (int i = 0; i < 10; i++) begin
            a = $urandom_range(0, 32'hFF);  // Assign random 32-bit values to 'a'
            b = $urandom_range(0, 32'hF);  // Assign random 32-bit values to 'b'
            alucontrol = $urandom_range(0, 3'h7); // Assign random 3-bit values to 'alucontrol'
            #10;  // Wait for 10 time units for each test pattern
        end
        
        // End the simulation
        $finish();
    end

endmodule
