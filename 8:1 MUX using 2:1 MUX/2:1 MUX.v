module MUX_21(
	input wire d0,d1,x,
	output reg y
);
always @ (*) begin
	y = (x&d1)|(~x&d0);
end
endmodule
