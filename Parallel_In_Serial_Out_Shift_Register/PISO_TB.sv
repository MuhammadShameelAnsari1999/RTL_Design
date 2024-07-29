// Testbench for the Parallel-In Serial-Out (PISO) Shift Register
// This testbench tests the PISO module with a clock, reset, and parallel input data.
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/kF2P

module PISO_Tb ();

    parameter WIDTH = 4;  // Width of the shift register

    logic clk;              // Clock signal
    logic rst_l;            // Active low reset signal
    logic shift_ld;         // Shift/load control signal
    logic [WIDTH-1:0] parallel_in; // Parallel input data

    wire empty_flag;        // Flag to indicate if the shift register is empty
    wire serial_out;        // Serial output data
    wire valid_o;           // Flag to indicate if there is valid data to shift

    // Instantiate the PISO module
    PISO #(.WIDTH(WIDTH)) dut (
        .Clk(clk),
        .Rst_l(rst_l),
        .Shift_LD(shift_ld),
        .Parallel_In(parallel_in),
        .Empty_Flag(empty_flag),
        .Serial_Out(serial_out),
        .Valid_O(valid_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test sequence
    initial begin
        $dumpfile("PISO.vcd");
        $dumpvars(0, PISO_Tb);

        rst_l = 1'b0;  // Apply reset
        shift_ld = 1'b0;
        parallel_in = 4'h0;
        #15;           // Hold reset for 15 time units

        rst_l = 1'b1;  // Release reset
        #10;           // Wait for 10 time units

        parallel_in = 4'hC;  // Load parallel data
        #10;
        shift_ld = 1'b1;     // Enable shifting
        #40;                 // Shift for 40 time units

        shift_ld = 1'b0;     // Disable shifting
        parallel_in = 4'h9;  // Load new parallel data
        #10;
        shift_ld = 1'b1;     // Enable shifting
        #40;                 // Shift for 40 time units

        shift_ld = 1'b0;     // Disable shifting
        parallel_in = 4'hA;  // Load another parallel data
        #10;
        shift_ld = 1'b1;     // Enable shifting
        #40;                 // Shift for 40 time units

        $finish;  // End the simulation
    end

endmodule
