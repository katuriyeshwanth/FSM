module test;
reg clock;
wire [0:2]light;
cyclic_lamp dut(clock,light);
initial
clock=1'b0;
always #5 clock=~clock;
initial
begin
#100 $finish;
end
initial
begin
  $dumpfile("cyclic_lamp.vcd");
  $dumpvars(0,test);
$monitor("time=%0t,light:%b,clock=%b",$time,light,clock);
end
endmodule

//serial parity detector

module test;
reg clk,x;
wire z;
parity dut(clk,x,z);
initial 
clk=1'b0;
always #5 clk=~clk;
initial
begin
  $dumpfile("parity.vcd");
  $dumpvars(0,test);
#2 x=0; #10 x=1; #10 x=1; #10 x=0; #10 x=1; #10 x=0; #10 x=0; #10 x=1; #10 x=1;
#10 $finish;
end
endmodule
