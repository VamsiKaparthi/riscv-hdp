module alu(input[3:0]a,input[3:0]b,input[2:0]sel, output reg[3:0] out);

always@(*) begin
	case(sel[2:0])
	    3'b000:out=0;
            3'b001:out=a+b;
            3'b010:out=a-b;
            3'b011:out=a&b;
            3'b100:out=a|b;
            3'b101:out=~a;
            3'b110:out=~b;	
            3'b111:out=0;
            default:out=0;
        endcase
end

endmodule
