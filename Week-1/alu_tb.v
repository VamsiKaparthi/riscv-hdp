module alu_tb;

reg[3:0]a;
reg[3:0]b;
reg[2:0]sel;
wire[3:0]c;

alu i1(.a(a),.b(b),.sel(sel),.out(c));

initial begin
$dumpfile("test_alu.vcd");
$dumpvars(0,alu_tb);

#1 a=4'b0010;
#2 b=4'b0001;
#4 sel=3'b000;
#5 sel=3'b001;
#10 sel=3'b010;
#15 sel=3'b011;
#20 sel=3'b100;
#25 sel=3'b101;
#30 sel=3'b110;
#35 sel=3'b111;


#50 $finish;

end

endmodule
