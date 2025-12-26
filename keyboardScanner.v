module keyboardScanner(
output reg [3:0]row,
input [3:0]col,
input clk,
input reset_n,
output reg [4:0]keyout
);

reg [3:0]creturn;
wire clkk;
always@(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		begin
		row<=4'b1110;
		keyout<=5'b00000;
		creturn<=4'b1111;
		end
	else 
		begin
		creturn=col;
		case({row,creturn})
		8'b1110_1110:keyout=5'b1_0000;
		8'b1110_1101:keyout=5'b1_0001;
		8'b1110_1011:keyout=5'b1_0010;
		8'b1110_0111:keyout=5'b1_0011;
	
		8'b1101_1110:keyout=5'b1_0100;
		8'b1101_1101:keyout=5'b1_0101;
		8'b1101_1011:keyout=5'b1_0110;
		8'b1101_0111:keyout=5'b1_0111;
	
		8'b1011_1110:keyout=5'b1_1000;
		8'b1011_1101:keyout=5'b1_1001;
		8'b1011_1011:keyout=5'b1_1010;
		8'b1011_0111:keyout=5'b1_1011;
	
		8'b0111_1110:keyout=5'b1_1100;
		8'b0111_1101:keyout=5'b1_1101;
		8'b0111_1011:keyout=5'b1_1110;
		8'b0111_0111:keyout=5'b1_1111;
		default:keyout=5'b0_0000;
		endcase

		//row={row[2:0],row[3]};
		end
		end





		endmodule