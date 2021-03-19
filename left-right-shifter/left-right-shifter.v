module shift(
input [7:0] d,
input [2:0] s,
input c,
output [7:0] out
);
wire [7:0] out_left;
wire [7:0] mag0;
wire [7:0] mag1;
wire [7:0] mag2;
wire temp1;
wire [1:0] temp2;
wire [3:0] temp3;

//if control input is 1, reverse the data input; based on control, shifts left or right
MUX_21 reverse1(d[0],d[7],c,mag0[0]);
MUX_21 reverse2(d[1],d[6],c,mag0[1]); 
MUX_21 reverse3(d[2],d[5],c,mag0[2]); 
MUX_21 reverse4(d[3],d[4],c,mag0[3]); 
MUX_21 reverse5(d[4],d[3],c,mag0[4]); 
MUX_21 reverse6(d[5],d[2],c,mag0[5]); 
MUX_21 reverse7(d[6],d[1],c,mag0[6]); 
MUX_21 reverse8(d[7],d[0],c,mag0[7]); 



// 1 bit shift left
MUX_21 lsb_1(mag0[0],1'b0,s[0],mag1[0]);
MUX_21 msb_1[7:1](mag0[7:1],mag0[6:0],s[0],mag1[7:1]);

// 2 bit shift left
MUX_21 lsb_2[1:0](mag1[1:0],1'b0,s[1],mag2[1:0]);
MUX_21 msb_2[7:2](mag1[7:2],mag1[5:0],s[1],mag2[7:2]);

// 4 bit shift left
MUX_21 lsb_3[3:0](mag2[3:0],1'b0,s[2],out_left[3:0]);
MUX_21 msb_3[7:4](mag2[7:4],mag2[3:0],s[2],out_left[7:4]);

// based on control input whether to leftshift or rightshift
MUX_21 reverse21(out_left[0],out_left[7],c,out[0]);
MUX_21 reverse22(out_left[1],out_left[6],c,out[1]);
MUX_21 reverse23(out_left[2],out_left[5],c,out[2]);
MUX_21 reverse24(out_left[3],out_left[4],c,out[3]);
MUX_21 reverse25(out_left[4],out_left[3],c,out[4]);
MUX_21 reverse26(out_left[5],out_left[2],c,out[5]);
MUX_21 reverse27(out_left[6],out_left[1],c,out[6]);
MUX_21 reverse28(out_left[7],out_left[0],c,out[7]);

endmodule
