module cyclic_lamp(clock,light);
input clock;
output reg[0:2]light;
parameter s0=0,s1=1,s2=2;
parameter red=3'b100,green=3'b010,yellow=3'b001;
reg [0:1]state;
initial
begin
state =s0;
light =green;
end
always @(posedge clock)
case(state)
s0:begin
light <= green; state <=s1;
end
s1:begin
light <= yellow; state <=s2;
end
s2:begin
light <= red; state <=s0;
end
default :begin
light <= red;
state <= s0;
end
endcase
endmodule

//serial parity checker
module parity(clk,x,z);
input clk,x;
output reg z;
reg even_odd;
parameter even=0,odd=1;
always @(posedge clk)
case (even_odd)
even:begin z<= x?1:0;
    even_odd <=x?odd:even;
    end
odd:begin z<= x?0:1;
    even_odd <=x?even:odd;
    end
default:even_odd <= even;
endcase
endmodule 
