module MUX_21 (
input d0,d1,
input s,
output out
);
wire [1:0] k;
wire s1;
not s_not(s1,s);
and p1(k[0],d1,s);
and p2(k[1],d0,s1);
or p3(out,k[0],k[1]);
endmodule
