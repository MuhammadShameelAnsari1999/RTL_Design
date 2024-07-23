// Code your testbench here
// or browse Examples
module Mux_Tb();
  logic [3:0]a,b;
  logic sel;
  logic [3:0]c;
  
  //Mux dut(.*);
  Mux dut(
  .A(a),
  .B(b),
  .Sel(sel),
  .C(c));
  
  initial
    begin
      $dumpfile("Mux.vcd");
      $dumpvars(0, Mux_Tb);
      
      for (int i ; i < 10 ; i++)
        begin
          a = $urandom_range (0, 8'hFF);
          b = $urandom_range (0, 8'hFF);
          sel = $urandom%2;
          #5;
        end
      $finish();
    end
endmodule