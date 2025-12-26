`timescale 1 ns / 10 ps

module FSTB;


reg clk;
reg reset_n;
reg [7:0]note_test;
wire out;
wire osc_test;
wire [7:0]div_test;
wire bfoct_test;

FreqSynth test(
.clk(clk),
.reset_n(reset_n),
.note(note_test),
.vib(out),
.osc_test(osc_test),
.div_test(div_test),
.bfoct_test(bfoct_test)
);
initial begin
		clk=1'b1;
		end
    always #10 clk = ~clk;

initial 
begin
reset_n=0;
note_test=8'b10100111;
#15 reset_n=1;
end


endmodule