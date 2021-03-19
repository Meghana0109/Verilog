module one_bit_adder(
input a,b,cin,
output s,
output cout
);
assign s=a^b^cin;
assign cout=(a&b)|(b&cin)|(a&cin);
endmodule
