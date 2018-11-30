`timescale 1ns / 1ps    

module Multiplier(clock, x, y, out, state);
    input clock;
    input [7:0] x;
    input [7:0] y;
    input state;
    output [15:0] out;
    reg [15:0] out;
    
    initial begin
        out = 16'b0;
    end

    always @(posedge clock) begin
        if (state == 1) begin
            if (y[7] == 1) begin
                out = out + (x << 7);  
            end
            if (y[6] == 1) begin
                out = out + (x << 6);  
            end
            if (y[5] == 1) begin
                out = out + (x << 5);  
            end
            if (y[4] == 1) begin
                out = out + (x << 4);  
            end
            if (y[3] == 1) begin
                out = out + (x << 3);  
            end
            if (y[2] == 1) begin
                out = out + (x << 2);  
            end
            if (y[1] == 1) begin
                out = out + (x << 1);  
            end
            if (y[0] == 1) begin
                out = out + (x << 0);  
            end                                                                                    
        end
    end
endmodule