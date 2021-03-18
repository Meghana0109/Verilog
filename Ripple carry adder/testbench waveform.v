module adder_tb;
reg[3:0] a;
reg[3:0] b;
wire[3:0] s;
wire cout;
reg cin;

ripple_adder adder_1(a,b,cin,s,cout);

initial begin
$monitor("Time=%5d, a=%b, b=%b, cin=%b, s=%b, cout=%b\n",$time,a,b,cin,s,cout);
#0; a=0;b=0;cin=0; #50; a=1;b=4'b0010;cin=0; #50; a=6; #50; b=4'b1000; #50; a=10; #50; cin=1; #50 $finish;
end

initial
begin
$dumpfile("ripple_adder.vcd");
$dumpvars;
end

endmodule
