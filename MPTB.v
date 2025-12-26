`timescale 1 ns / 10 ps

module MPTB();

reg clk;
reg reset_n;
reg [4:0]keyboard;
wire out;
reg [3:0]col;

wire [3:0]row;
wire [7:0]onote_test;
wire [6:0]addr_test;
wire [4:0]keyboard_test;

always@(keyboard,col,row)
begin
if(keyboard[4])
begin
case(keyboard[3:0])
4'b0000:
		case(row)
		4'b1110:col=4'b1110;
		default:col=4'b1111;
		endcase
4'b0001:
		case(row)
		4'b1110:col=4'b1101;
		default:col=4'b1111;
		endcase
4'b0010:
		case(row)
		4'b1110:col=4'b1011;
		default:col=4'b1111;
		endcase
4'b0011:
		case(row)
		4'b1110:col=4'b0111;
		default:col=4'b1111;
		endcase
////////////////////////////////////////////////////////////////////////////////////
4'b0100:
		case(row)
		4'b1101:col=4'b1110;
		default:col=4'b1111;
		endcase
4'b0101:
		case(row)
		4'b1101:col=4'b1101;
		default:col=4'b1111;
		endcase
4'b0110:
		case(row)
		4'b1101:col=4'b1011;
		default:col=4'b1111;
		endcase
4'b0111:
		case(row)
		4'b1101:col=4'b0111;
		default:col=4'b1111;
		endcase
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////		
4'b1000:
		case(row)
		4'b1011:col=4'b1110;
		default:col=4'b1111;
		endcase
4'b1001:
		case(row)
		4'b1011:col=4'b1101;
		default:col=4'b1111;
		endcase
4'b1010:
		case(row)
		4'b1011:col=4'b1011;
		default:col=4'b1111;
		endcase
4'b1011:
		case(row)
		4'b1011:col=4'b0111;
		default:col=4'b1111;
		endcase
////////////////////////////////////////////////////////////////////////////////////
4'b1100:
		case(row)
		4'b0111:col=4'b1110;
		default:col=4'b1111;
		endcase
4'b1101:
		case(row)
		4'b0111:col=4'b1101;
		default:col=4'b1111;
		endcase
4'b1110:
		case(row)
		4'b0111:col=4'b1011;
		default:col=4'b1111;
		endcase
4'b1111:
		case(row)
		4'b0111:col=4'b0111;
		default:col=4'b1111;
		endcase

endcase
end
else
col=4'b1111;
end

initial clk=1'b1;
    always #10 clk = ~clk;
initial begin
			reset_n=0;
			#15 reset_n=1;
			end

initial begin 
keyboard<=5'b00000;		
#500 		keyboard<=5'b10000;
#100 		keyboard<=5'b00000;	
#105000 	keyboard<=5'b10101;
#1000 	keyboard<=5'b00000;
#1000 	keyboard<=5'b10000;
#1000 	keyboard<=5'b00000;
#100000 	keyboard<=5'b10001;
#1000 	keyboard<=5'b00000;
#100000 	keyboard<=5'b10010;
#100 		keyboard<=5'b00000;
#10000 	keyboard<=5'b10000;
#100 		keyboard<=5'b00000;
end			
	




	
MusicPlayer MusicPlayer_test(
.clk_raw(clk),//50MHz
.reset_n(reset_n),
.row(row),
.col(col),//7-4 r0-r3 3-0 c0-c3
.out(out),
.onote_test(onote_test),
.addr_test(addr_test),
.keyboard_test(keyboard_test)
 );

endmodule