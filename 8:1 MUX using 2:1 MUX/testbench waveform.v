module multiplex_tb;
reg[7:0] d;
reg [2:0] x;
wire y;

MUX_81 mux(d,x,y);

initial begin
$monitor("Time=%5d: Select Inputs: x0 = %b, x1 = %b, x2 = %b, Output: y = %b",$time,x[0],x[1],x[2],y);
#0; d = 8'b01100110; x=3'b000; #50; x=3'b001; #50; x=3'b010; #50; x=3'b011; #50; x=3'b100; #50; x=3'b101; #50; x=3'b110; #50; x=3'b111; #50 $finish;
end

initial begin
$dumpfile("multiplexer.vcd");
$dumpvars;
end
endmodule
