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
