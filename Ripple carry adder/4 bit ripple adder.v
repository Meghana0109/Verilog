module ripple_adder(
	input [3:0] a,b,
	input cin,
	output [3:0] s,
	output cout
);
wire cout1, cout2, cout3;
one_bit_adder adder1(a[0],b[0],cin,s[0],cout1);
one_bit_adder adder2(a[1],b[1],cout1,s[1],cout2);
one_bit_adder adder3(a[2],b[2],cout2,s[2],cout3);
one_bit_adder adder4(a[3],b[3],cout3,s[3],cout);

endmodule
