module adder_tb;
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] out_cla,out_rc;
wire cout_cla,cout_rc;

cla_adder cla(a,b,cin,out_cla,cout_cla);
ripple_adder ripple(a,b,cin,out_rc,cout_rc);

 initial begin
        $monitor("Time = %5d, a = %b, b = %b, sum_cla = %b, cout_cla = %b\n",$time,a,b,out_cla,cout_cla);
        #0; cin =0; a = 4'b0010; b = 4'b1110; #25; a = 4'b0010; b = 4'b1010; #25; a = 4'b0010; b = 4'b0111; #25; a = 4'b0110; b = 4'b0110; #25; $finish;
 end
 initial begin
        $dumpfile("adder_cla_rc.vcd");
        $dumpvars();
 end

endmodule
