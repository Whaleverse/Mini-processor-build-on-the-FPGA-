module charset_rom(
	input clk,
	input [7:0] char,
	input [2:0] row,col,
	output reg active);
	
	reg [63:0] charset_mem [0:255];
	reg [5:0] tmp;
	initial begin
		$readmemb("/home/klemmon/Desktop/Fall2019/CS3710/FinalProject/IO/display/charset.mem",charset_mem,0,255);
	end
	
	always @(posedge clk) begin
		tmp = (row<<3) | col;
		active = charset_mem[char][ tmp ];
	end
	
endmodule