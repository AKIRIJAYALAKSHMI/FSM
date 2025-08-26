`include "fsm.v"
module tb;
   reg clk;
   reg  reset;
   reg din;
   wire dout;
  
  sd1001_moore dut (.*);
  initial begin 
    clk = 1;
    forever #5 clk=~clk;  
  end  
  
  initial begin 
  reset=1; #10;
  reset=0; #60;
  reset= 1; #10;
  $finish ;
  end
 
  
  initial begin 
  din=1; #10;
  din=1; #10;
  din=0; #10;
  din=0; #10;
  din=1; #10;
  din=0; #10;
    din=1;
  end
  
  
  
  initial begin
    $monitor("Time=%0t clk=%b reset=%b din=%b dout=%b state=%0d", 
              $time, clk, reset, din, dout, dut.state);
  end
endmodule
