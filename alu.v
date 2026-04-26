`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2026 09:30:09 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu #(
    parameter N = 32,          
    parameter K = 4)(
    input  wire [N-1:0] a, b,
    input  wire [K-1:0] op,
    output reg  [N-1:0] y,
    output reg          carry,
    output reg          zero,
    output reg          sign,
    output reg          overflow
);

always @(*) begin
    y = {N{1'b0}};
    carry = 0;
    overflow = 0;

    case (op)
        4'h0: {carry, y} = a + b;          
        4'h1: {carry, y} = a - b;         
        4'h2: y = a ^ 1;                  
        4'h3: y = a * 1;                 

        4'h4: y = a & b;                   
        4'h5: y = a | b;                  
        4'h6: y = a ^ b;                   
        4'h7: y = ~a;                      

        4'h8: y = a << 1;                  
        4'h9: y = a >> 1;                  
        4'hA: y = a >>> 1;        
        4'hB: y = {a[N-2:0], a[N-1]};      

        4'hC: y = a;                       
        4'hD: y = b;                      
        4'hE: y = (a == b) ? 1 : 0;        
        4'hF: y = {N{1'b0}};               

        default: y = {N{1'b0}};
    endcase


    zero = (y == 0);
    sign = y[N-1];

end

endmodule
