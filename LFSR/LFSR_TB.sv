// Testbench for the 4-bit Linear Feedback Shift Register (LFSR)
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/S9_q

module LFSR_Tb();
    logic clk, rst_l;           // Clock and Reset (active low) signals for testbench
    logic [3:0] out;            // 4-bit output from the design under test (DUT)

    // Instantiate the LFSR
    LFSR dut(
            .Clk(clk),
            .Rst_l(rst_l),
            .Out(out)
    );

    // Initial block for clock generation
    initial
    begin
        clk = 0;                // Initialize clock to 0
        forever
            #5 clk = ~clk;      // Toggle clock every 5 time units
    end

    // Initial block for simulation control
    initial begin
        $dumpfile("LFSR.vcd");   // Specify the output file for waveform viewing
        $dumpvars(0, LFSR_Tb);   // Dump all variables in the testbench

        rst_l = 1'b0;            // Apply reset
        #20;

        rst_l = 1'b1;            // Release reset
        #200;
        $finish();               // End the simulation
    end

endmodule
