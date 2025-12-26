module scorereader(
input clk,
input reset_n,
input osc,
input [4:0]keybord,
input [7:0]inote,
output reg [6:0]addr,
output reg [7:0]onote,
output reg playing //0为待机，1为正在播放

,output [4:0]addr_cnt_test,
output btosc_test
);

reg restart;
reg [1:0]songchoose;
wire btosc;
wire [4:0]addr_cnt;

assign addr_cnt_test=addr_cnt;
assign btosc_test=btosc;

always@(posedge clk or negedge reset_n)
begin 
	if(!reset_n)
		begin
			onote=8'b0000_0000;
			addr=7'b000_0000;
			playing=1'b0;
			songchoose=2'b01;
			restart=1'b0;
		end
	else
		begin
		if((inote[7]==1'b0)||(addr[4:0]==5'b11111))
			begin
				playing=1'b0;
				restart=1'b1;
			end
		else
			begin
				case(keybord)
				5'b10000://播放
begin
					playing=1'b1;

					restart=1'b0;

					end
				5'b10001://暂停
					begin
						playing=1'b0;
					end
				5'b10010://停止
					begin
						playing=1'b0;
						restart=1'b1;
					end
				5'b10100:
					begin
						playing=1'b0;
						restart=1'b1;
						songchoose=2'b00;
					end
				5'b10101:
					begin
						
						playing=1'b0;
						restart=1'b1;
						songchoose=2'b01;
					end
				5'b10110:
					begin
						playing=1'b0;
						restart=1'b1;
						songchoose=2'b10;
					end
				5'b10111:
					begin
						playing=1'b0;
						restart=1'b1;
						songchoose=2'b11;
					end
//				default:
//					begin
//						playing=playing;
//						restart=restart;
//						songchoose=songchoose;
//					end
				endcase

				if(playing==1'b1)
					begin onote<=inote; end
				else
					begin onote<=8'b00000000;end
		end
		addr[6:5]=songchoose;
		addr[4:0]=addr_cnt;
		end
		end


		
beatct beat(
	.aclr(!reset_n),
	.clock(clk),
	.cnt_en(playing&btosc),
	.sclr(restart),
	.q(addr_cnt)
	);
		
		
			
beater btr(//15bit counter
	.aclr(!reset_n),
	.clock(clk),
	.cout(btosc)
);
endmodule