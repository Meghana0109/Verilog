module sram #(parameter ADDR = 4, DAT = 32, DEPTH = 16)
    (clk, addr, data, cs, we, oe); 
    input clk, cs, we, oe;
    input [ADDR-1:0] addr; 
    inout [DAT-1:0] data;
    reg [DAT-1:0] tmp_data;
    reg [DAT-1:0] mem [DEPTH-1:0];

    always @(posedge clk) begin
        if (cs & we) mem[addr] <= data;

    end

    always @(posedge clk) begin
        if (cs & !we) tmp_data <=mem[addr];
    end

    assign data = cs & oe & !we ? tmp_data : 'hz;



endmodule

module testbench;
    parameter ADDR = 4;
    parameter DAT = 16;
    parameter DEPTH = 16;

    reg clk, cs, we, oe; 
    reg [ADDR-1:0] addr; 
    reg [DAT-1:0] tb_data;
    wire [DAT-1:0] data;

    sram #(.DAT(DAT)) ram0 (clk, addr, data, cs, we, oe);

    always #10 clk = ~clk;
    assign data = !oe ? tb_data : 'hz;
    initial begin 
        {clk, cs, we, addr, tb_data, oe} <= 0;
        repeat (2) @ (posedge clk);

        for (integer i = 0; i<2**ADDR;i=i+1) begin
            repeat (1) @ (posedge clk) addr <=i; we <=1; cs<=1; oe<=0; tb_data <= (i+i)%32;
        end

        for (integer i=0; i < 2**ADDR; i=i+1) begin
            repeat (1) @(posedge clk) addr <=i; we <=0; cs <=1; oe<=1;
        end

        #20 $finish;
    end

    initial begin 
        $monitor ("Address = %2d, Data = %8d", addr, data);
    end
endmodule
