module full_adder_w_delay (
    input a,
    input b,
    input cin,
    output reg sum
);

    always @(*)begin
        #5;
        sum = a^b^cin;
    end
    
endmodule
