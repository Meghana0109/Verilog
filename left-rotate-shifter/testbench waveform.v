module part1_tb;
reg [7:0] d;
reg [2:0] s;
wire [7:0] out;
reg c;
leftshift shift(d,s,c,out);
integer i;

initial begin
  #0 s = 3'b000; c =0;
  d = 8'b10101010;
  for(i = 0; i<7 ; i=i+1) begin 
	#20 s = s + 1;
  end
  #20 s = 3'b000; c =1;
  for(i = 0; i<7 ; i=i+1) begin 
	#20 s = s + 1;
  end
end
initial $monitor("Time=%5d,Output data=%b,select line=%b,input data=%b , control = %b",$time,out,s,d,c);
initial #380 $finish;

initial
begin
  $dumpfile("part1.vcd");
  $dumpvars;
end

endmodule
