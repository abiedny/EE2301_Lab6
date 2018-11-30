`timescale 1ns / 1ps    

//this works somehow. It's just combinational and sorta for testing I guess?
module Multiplier(x, y, out, done);
    input [7:0] x;
    input [7:0] y;
    output [15:0] out;
    output done;
    reg [15:0] out;
    reg done;
    
    initial begin
        done = 0;
        out = 16'b0;
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
        done = 1;                                                                                 
    end
endmodule

module Wrapper(x, y, start, state, clock, out);
    input [7:0] x;
    input [7:0] y;
    input start; //button u press to start it
    output state;
    input clock;
    output [15:0] out;
    reg state;
    reg [15:0] out;
    
    initial begin
        state = 'b0;
    end
    
    always @(start) begin
        //when the start button is pressed our inputs are ready and we can go to state 1 to do that math
        //or if we're in the final state then go back to the start state
        if (state == 'b0) state = 'b1;
        else if (state == 'b10) state = 'b0;
    end
    
    always @(posedge clock) begin
        if (state == 'b1) begin //if we're in the multiplication state, do multiplication
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
            state = 'b10; 
        end
        else if (state == 'b10) begin
            //Multiplication is done so display it
        end
    end
    
endmodule