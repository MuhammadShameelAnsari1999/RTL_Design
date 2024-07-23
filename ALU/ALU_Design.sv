// Module definition for ALU with various operations
module ALU(
  input logic [31:0] A, B,        // 32-bit data inputs A and B
  input logic [2:0] ALUControl,   // 3-bit control signal to select ALU operation
  output logic [31:0] ALUResult,  // 32-bit result of the ALU operation
  output logic Zero,              // Zero flag: 1 if ALUResult is zero
  output logic Carry,             // Carry flag: 1 if there is a carry out
  output logic Overflow,          // Overflow flag: 1 if there is an overflow
  output logic Negative           // Negative flag: 1 if ALUResult is negative
);

  // Internal signal for sum result and carry out
  logic [31:0] Sum;
  logic Cout;

  // Combinational logic for ALU operations using ternary operators
  always_comb begin
    Cout = 1'b0;
    {Cout,Sum} = ~ALUControl[0] ? A + B : A + (~B + 1);
    
    // Determine the ALU result based on ALUControl using ternary operators
    ALUResult = (ALUControl == 3'h0) ? Sum :              // Addition
    			(ALUControl == 3'h1) ? Sum :       // Subtraction
                (ALUControl == 3'h2) ? A & B :              // AND
                (ALUControl == 3'h3) ? A | B :              // OR
                (ALUControl == 3'h4) ? A ^ B :              // XOR
                (ALUControl == 3'h5) ? {{31{1'b0}}, A[31]} :// Sign bit of A
                (ALUControl == 3'h6) ? A << B :             // Logical left shift
                (ALUControl == 3'h7) ? A >> B :             // Logical right shift
                32'h0;                                      // Default case

    // Set the Zero flag if ALUResult is zero
    Zero = &(~ALUResult);

    // Set the Negative flag if the most significant bit of ALUResult is 1
    Negative = ALUResult[31];

    // Compute Overflow for addition and subtraction
    Overflow = ((Sum[31] ^ A[31]) & 
                  (~(ALUControl[0] ^ B[31] ^ A[31])) &
                  (~ALUControl[1]));

    // Set the Carry flag for addition and subtraction
    Carry = ((~ALUControl[1]) & Cout);
  end

endmodule
