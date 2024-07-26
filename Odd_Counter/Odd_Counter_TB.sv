// Testbench for the Odd Counter
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/MbTz

module Odd_Counter_Tb();
    logic clk, rst_l;        // Clock and reset signals
    logic [31:0] count;      // Counter output from DUT

    // Instantiate the Odd_Counter module
    Odd_Counter Odd_Counter_dut(
        .Clk(clk),
        .Rst_l(rst_l),
        .Count(count)
    );

    // Initial block for clock generation
    initial begin
        clk = 0;              // Initialize clock to 0
        forever begin
            #5 clk = ~clk;    // Toggle clock every 5 time units
        end
    end

    // Initial block for testbench control
    initial begin
        $dumpfile("Odd_Counter.vcd");  // Generate VCD file for waveform viewing
        $dumpvars(0, Odd_Counter_Tb);  // Dump all variables in this testbench

        rst_l = 1'b0;   // Assert reset
        #20;            // Wait for 20 time units

        rst_l = 1'b1;   // Deassert reset
        #100;           // Wait for 100 time units

        $finish();      // End the simulation
    end
endmodule
