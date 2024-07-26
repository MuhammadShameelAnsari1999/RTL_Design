module Serial_Shift_Register_Tb();
    logic clk, rst_l, serial_in;    // Testbench signals
    logic [3:0] serial_out;         // Output from the DUT

    // Instantiate the DUT (Device Under Test)
    Serial_Shift_Register SSR (
        .Clk(clk),
        .Rst_l(rst_l),
        .Serial_In(serial_in),
        .Serial_Out(serial_out)
    );

    // Clock generation: Toggle the clock every 5 time units
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $dumpfile("Serial_Shift_Register.vcd");   // VCD file for waveform viewing
        $dumpvars(0, Serial_Shift_Register_Tb);  // Dump all variables in the testbench

        rst_l = 1'b0; // Apply reset
        #20;

        rst_l = 1'b1; // Release reset
        for (int i = 0; i < 10; i++) begin
            serial_in = $urandom_range(0, 1); // Generate random serial input
            #10; // Wait for 10 time units
        end

        $finish(); // End the simulation
    end

endmodule
