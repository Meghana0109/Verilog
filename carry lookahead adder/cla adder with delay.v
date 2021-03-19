module cla_adder (
    input wire[3:0] a,
    input wire[3:0] b,
    input wire cin,
    output reg[3:0] out,
    output reg cout
);
    reg cout0,cout1,cout2;
    wire sum0,sum1,sum2,sum3;
    //adder bank
    full_adder_w_delay fa1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum0));
    full_adder_w_delay fa2(.a(a[1]),.b(b[1]),.cin(cout0),.sum(sum1));
    full_adder_w_delay fa3(.a(a[2]),.b(b[2]),.cin(cout1),.sum(sum2));
    full_adder_w_delay fa4(.a(a[3]),.b(b[3]),.cin(cout2),.sum(sum3)); 
    always @(*) begin
      //output carry
      cout0 = (a[0]&b[0])|((a[0]^b[0])&cin);
      cout1 = (a[1]&b[1])|((a[1]^b[1])&cout0);
      cout2 = (a[2]&b[2])|((a[2]^b[2])&cout1);
      cout  = (a[3]&b[3])|((a[3]^b[3])&cout2);

      //concatenation operator
      out = {sum3, sum2, sum1, sum0};
    end

endmodule
