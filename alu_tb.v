`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2026 10:13:34 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    parameter N = 32;
    parameter K = 4;

    reg  [N-1:0] a, b;
    reg  [K-1:0] op;

    wire [N-1:0] y;
    wire carry, zero, sign, overflow;

    // Instantiate DUT
    alu #(N, K) uut (
        .a(a),
        .b(b),
        .op(op),
        .y(y),
        .carry(carry),
        .zero(zero),
        .sign(sign),
        .overflow(overflow)
    );

    integer i;

    initial begin


        // Test 1: Fixed values
        a = 32'd10; 
        b = 32'd5;

        for (i = 0; i < 16; i = i + 1) begin
            op = i;
            #10;
            $display("OP=%h | A=%0d B=%0d | Y=%0d | C=%b Z=%b S=%b",
                      op, a, b, y, carry, zero, sign);
        end

        // Test 2: Negative numbers
        a = -32'd15;
        b = 32'd3;

        for (i = 0; i < 16; i = i + 1) begin
            op = i;
            #10;
            $display("OP=%h | A=%0d B=%0d | Y=%0d | C=%b Z=%b S=%b",
                      op, a, b, y, carry, zero, sign);
        end

        // Test 3: Edge cases
        a = 32'hFFFFFFFF; // -1 signed
        b = 32'd1;

        for (i = 0; i < 16; i = i + 1) begin
            op = i;
            #10;
            $display("OP=%h | A=%0d B=%0d | Y=%0d | C=%b Z=%b S=%b",
                      op, a, b, y, carry, zero, sign);
        end

        // Test 4: Random values
        repeat (10) begin
            a = $random;
            b = $random;

            for (i = 0; i < 16; i = i + 1) begin
                op = i;
                #10;
                $display("OP=%h | A=%0d B=%0d | Y=%0d | C=%b Z=%b S=%b",
                          op, a, b, y, carry, zero, sign);
            end
        end

 
        $finish;
    end

endmodule
