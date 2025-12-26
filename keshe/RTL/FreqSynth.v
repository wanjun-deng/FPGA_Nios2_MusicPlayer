module FreqSynth(
input clk,//50MHz
input reset_n,
input playing,
input [7:0]note,//音符编码
input [1:0]volume,//音量控制(4级)
output reg vib//音符音高

//测试端口

,output osc_test
,output [7:0]div_test
,output bfoct_test


);

	
	
	
	
	
	//内部连线
	wire osc;
	reg freqout;
	reg [7:0]div;
	wire [7:0]scalediv_q_to_cp;
	wire bfoct;
	wire [3:0]octs;
	//测试连线
	assign osc_test=osc;
	assign div_test=div;
	assign bfoct_test=bfoct;
	
	reg [7:0] pwm_cnt;
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) pwm_cnt <= 8'd0;
		else pwm_cnt <= pwm_cnt + 1'b1;
	end
	// 4级音量映射：00->0%, 01->25%, 10->50%, 11->75%
	wire pwm_out = (pwm_cnt < {volume, 6'b000000});
	
always@(posedge clk or negedge reset_n)
begin 
	if(!reset_n)
		vib<=1'b0;
	else
		case(playing)
		1'b1:vib<=freqout & pwm_out;
		1'b0:vib<=1'b0;//起止判断
		endcase
		case(note[6:4])
		3'b000:freqout<=octs[3];
		3'b001:freqout<=octs[2];
		3'b010:freqout<=octs[1];
		3'b011:freqout<=octs[0];
		3'b100:freqout<=bfoct;
		default:freqout<=1'b0;//八度选择
		endcase
		case(note[3:0])
		4'b0000:begin freqout<=1'b0;div<=8'b0;end
		4'b0001:div<=8'b0011_0111;
		4'b0010:div<=8'b0011_0100;
		4'b0011:div<=8'b0011_0010;
		4'b0100:div<=8'b0010_1111;
		4'b0101:div<=8'b0010_1100;
		4'b0110:div<=8'b0010_1010;
		4'b0111:div<=8'b0010_0111;
		4'b1000:div<=8'b0010_0101;
		4'b1001:div<=8'b0010_0011;
		4'b1010:div<=8'b0010_0010;
		4'b1011:div<=8'b0001_1111;
		4'b1100:div<=8'b0001_1101;//频率生成
		default:
		begin freqout<=1'b0;div<=8'b0;end
		endcase
end
preDiv preDiv1(
   .aclr(!reset_n),
	.clock(clk),
	.cout(osc)
);

cp cp1 (
	.dataa(scalediv_q_to_cp),
	.datab(div),
	.clock(clk),
	.ageb(bfoct),
	.aclr(!reset_n)
	);
scalediv scalediv1(
	.aclr(!reset_n),
	.clock(clk),
	.clk_en(osc),
	.sclr(bfoct),
	.q(scalediv_q_to_cp));

octdiv octdiv1(
	.aclr(!reset_n),
	.clock(bfoct),
	.q(octs)
);
endmodule
