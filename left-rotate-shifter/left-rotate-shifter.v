module leftshift (
input [7:0] d,
input [2:0] s,
input c,
output [7:0] out
);
wire [7:0] tr1;
wire [7:0] tr2;
wire tmp1;
wire [1:0] tmp2;
wire [3:0] tmp3;

MUX_21 lsb1_select(1'b0,d[7],c,tmp1); // when c is 0, then left shift; when c is 1, then right shift

// 1 bit shift left
MUX_21 lsb_1(d[0],tmp1,s[0],tr1[0]);
MUX_21 msb_1[7:1](d[7:1],d[6:0],s[0],tr1[7:1]);

MUX_21 msb1_select[1:0](1'b0,tr1[7:6],c,tmp2); //  when c is 0, then left shift; when c is 1, then right shift

// 2 bit shift left
MUX_21 lsb_2[1:0](tr1[1:0],tmp2[1:0],s[1],tr2[1:0]); 
MUX_21 msb_2[7:2](tr1[7:2],tr1[5:0],s[1],tr2[7:2]);     

MUX_21 select[3:0] (1'b0,tr2[7:4],c,tmp3); // when c is 0, then left shift; when c is 1, then right shift

MUX_21 lsb_3[3:0](tr2[3:0],tmp3[3:0],s[2],out[3:0]); 
MUX_21 msb_3[7:4](tr2[7:4],tr2[3:0],s[2],out[7:4]);   
endmodule
