`timescale 1ns / 1ps    

module Wrapper(sw, btnC, clock, led);
    input [15:0] sw;
    reg [7:0] x;
    reg [7:0] y;
    input btnC; //button u press to start it
    input clock;
    output [15:0] led;
    reg [1:0] state = 2'b00;
    reg [15:0] out;
    
    assign led = out;
    
    always @(posedge clock) begin
        if (state == 2'b01) begin //if we're in the multiplication state, do multiplication
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
            //and then when we done multiplying we move states to state 2
            state = 2'b10; 
        end
        
        else if (state == 2'b10) begin
            if(btnC) begin
            //reset the display and move back to state 0
                out = 16'b0000000000000000;
                state = 2'b00;
            end
        end
        
        if (state == 2'b00) begin
            if (btnC) begin
                x = sw[7:0];
                y = sw[15:8];
                state = 2'b01;
            end
        end
    end
    
endmodule