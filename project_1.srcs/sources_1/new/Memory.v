module Memory (
    input clk,
    input rd,           // Tín hiệu Read
    input wr,           // Tín hiệu Write (Write Enable)
    input [31:0] address,
    inout [31:0] data 
);

    reg [31:0] ram [0:1023];
    reg [31:0] data_out;
    
    // Chỉ đẩy data ra Bus khi có tín hiệu Read
    assign data = (rd) ? data_out : 32'bz;

    always @(posedge clk) begin
        if (wr) begin
            ram[address[11:2]] <= data; // Chỉ ghi khi có tín hiệu wr = 1 (State STORE)
        end
        else if (rd) begin
            data_out <= ram[address[11:2]]; 
        end
    end
endmodule