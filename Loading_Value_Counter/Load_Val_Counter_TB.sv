// Testbench for the Load Value Counter
// This testbench tests the Load_Value_Counter module with a clock, reset, and load value
// Here is the link where you can directly run this code on the EDA Playground Online Platform:
// https://www.edaplayground.com/x/EUVd

module Load_Value_Counter_Tb #(
    parameter WIDTH = 4  // Width of the counter and load value
) ();

    logic clk;              // Clock signal
    logic rst_l;            // Active low reset signal
    logic load_value_valid; // Load value valid signal
    logic [WIDTH-1:0] load_value; // Load value input
    logic [WIDTH-1:0] count;      // Counter output

    // Instantiate the Load_Value_Counter module
    Load_Value_Counter #(.WIDTH(WIDTH)) dut (
        .Clk(clk),
        .Rst_l(rst_l),
        .Load_Value_Valid(load_value_valid),
        .Load_Value(load_value),
        .Count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test sequence
    initial begin
        $dumpfile("Load_Value_Counter.vcd");
        $dumpvars(0, Load_Value_Counter_Tb);

        rst_l = 1'b0;  // Apply reset
        load_value_valid = 1'b0;
        load_value = 4'h0;
        #15;           // Hold reset for 15 time units

        rst_l = 1'b1;  // Release reset
        #20;           // Wait for 20 time units

        load_value_valid = 1'b1;  // Assert load value valid
        load_value = 4'hA;        // Set load value to 10
        #10;                      // Wait for 10 time units
        load_value_valid = 1'b0;  // Deassert load value valid
        #100;                     // Wait for 100 time units

        load_value_valid = 1'b1;  // Assert load value valid
        load_value = 4'h5;        // Set load value to 5
        #10;                      // Wait for 10 time units
        load_value_valid = 1'b0;  // Deassert load value valid
        #100;                     // Wait for 100 time units

        $finish;  // End the simulation
    end

endmodule
