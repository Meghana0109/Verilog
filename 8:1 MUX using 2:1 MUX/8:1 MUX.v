module MUX_81(
	input [7:0] d,
	input [2:0] x,
	output y
);
wire [5:0] z;

//First level of the tree

MUX_21 mux1(d[0],d[1],x[0],z[0]);
MUX_21 mux2(d[2],d[3],x[0],z[1]);
MUX_21 mux3(d[4],d[5],x[0],z[2]);
MUX_21 mux4(d[6],d[7],x[0],z[3]);

//Second level of the tree

MUX_21 mux5(z[0],z[1],x[1],z[4]);
MUX_21 mux6(z[2],z[3],x[1],z[5]);

//Final level of the tree
MUX_21 mux7(z[4],z[5],x[2],y);

endmodule
