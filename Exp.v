module Exp(
    input clk,
    input rst,
    input [31:0] x,
    input [31:0] n,
    output reg [31:0] res
);

reg [3:0] cs/*verilator public*/;
reg [3:0] ns;
reg [31:0] nn;
reg [31:0] xx;
reg [31:0] ress;
reg [31:0] y;

assign res = ress;


always @(posedge clk)begin
    if(rst)begin
    cs <= 4'd0;
    y <= 32'dx;
         
    end
    else
    cs <= ns;
end

always @(posedge clk)begin
     case(cs)
     4'd0: ns= (n != 0)? 4'd1 : 4'd0;
     4'd1: ns= 4'd2;
     4'd2: ns= (nn > 32'd1)? 4'd3 : 4'd4;
     4'd3: ns= 4'd2;
     4'd4: ns= 4'd5;
     4'd5: ns= 4'd7;
     4'd6: ns= 4'd7;
     4'd7: ns= 4'dx;
     default: ns= 4'dx;
     endcase


end
always @(posedge clk)begin
     case(cs)
     4'd0: begin
         
     end
     4'd1:begin y <= 32'd1;
         nn <= n;
         xx <= x;
          
     end
    
     4'd3: begin
         if(xx == x)
          y <= xx * y ; 
          
         xx <= xx* xx;    
         nn <= ((nn -1)/2);
         
     end
     4'd4: begin
         
         
         
     end
     4'd5: ress <= y * xx;
     4'd6: ress <= 0;
     4'd7: ress <= ress;

     default: ress <= 32'dx;
     endcase


end




endmodule