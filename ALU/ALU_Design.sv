// Design for a 32-bit ALU
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/MbSE

// Module definition for ALU with various operations (ALU using assign statements)
module ALU_UsingAssign(
  input [31:0] A, B,         // 32-bit data inputs A and B
  input [2:0] ALUControl,    // 3-bit control signal to select ALU operation
  output [31:0] ALUResult,   // 32-bit result of the ALU operation
  output Zero,               // Zero flag: 1 if ALUResult is zero
  output Carry,              // Carry flag: 1 if there is a carry out
  output Overflow,           // Overflow flag: 1 if there is an overflow
  output Negative            // Negative flag: 1 if ALUResult is negative
);

  // Internal signal for sum result and carry out
  wire [31:0] Sum;
  wire Cout;

  // Combinational logic for ALU operations using ternary operators
  assign {Cout, Sum} = ~ALUControl[0] ? {1'b0, A + B} : {1'b0, A + (~B + 1)};
    
  // Determine the ALU result based on ALUControl using ternary operators
  assign ALUResult = (ALUControl == 3'h0) ? Sum :              // Addition
                     (ALUControl == 3'h1) ? Sum :              // Subtraction
                     (ALUControl == 3'h2) ? A & B :            // AND
                     (ALUControl == 3'h3) ? A | B :            // OR
                     (ALUControl == 3'h4) ? A ^ B :            // XOR
                     (ALUControl == 3'h5) ? {{31{1'b0}}, A[31]} : // Sign bit of A
                     (ALUControl == 3'h6) ? A << B :           // Logical left shift
                     (ALUControl == 3'h7) ? A >> B :           // Logical right shift
                     32'h0;                                    // Default case

  // Set the Zero flag if ALUResult is zero
  assign Zero = &(~ALUResult);

  // Set the Negative flag if the most significant bit of ALUResult is 1
  assign Negative = ALUResult[31];

  // Compute Overflow for addition and subtraction
  assign Overflow = ((Sum[31] ^ A[31]) & 
                     (~(ALUControl[0] ^ B[31] ^ A[31])) &
                     (~ALUControl[1]));

  // Set the Carry flag for addition and subtraction
  assign Carry = ((~ALUControl[1]) & Cout);

endmodule

// Module definition for ALU with various operations (ALU using always_comb)
module ALU_UsingAlwaysComb(
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

  // ALU operation codes
  localparam ADD = 3'h0;
  localparam SUB = 3'h1;
  localparam AND = 3'h2;
  localparam OR = 3'h3;
  localparam XOR = 3'h4;
  localparam SLT = 3'h5;
  localparam SLL = 3'h6;
  localparam SRL = 3'h7;
  
  // Combinational logic for ALU operations using ternary operators
  always_comb begin
    // Determine Sum and carry out (Cout) based on ALUControl for addition/subtraction
    {Cout, Sum} = ~ALUControl[0] ? A + B : A + (~B + 1);
    
    // Determine the ALU result based on ALUControl using a case statement
    case (ALUControl)
      ADD, SUB: ALUResult = Sum;
      AND : ALUResult = A & B;
      OR : ALUResult = A | B;
      XOR : ALUResult = A ^ B;
      SLT : ALUResult = {{31{1'b0}}, A[31]};
      SLL : ALUResult = A << B;
      SRL : ALUResult = A >> B;
      default: ALUResult = 32'h00000000;
    endcase

    // Set the Zero flag if ALUResult is zero
    Zero = (ALUResult == 32'h0);

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
