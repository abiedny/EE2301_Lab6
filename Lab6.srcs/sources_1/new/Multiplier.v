`timescale 1ns / 1ps    

module Wrapper(sw, btnC, clock, led);
    input [15:0] sw;
    reg [7:0] x;
    reg [7:0] y;
    input btnC; //button u press to start it
    input clock;
    output [15:0] led;
    reg state = 2'b00;
    reg [15:0] out;
    
    assign led = out;
    
    /*always @(btnC) begin
        //when the start button is pressed our inputs are ready and we can go to state 1 to do that math
        //or if we're in the final state then go back to the start state
        //we also gonna load the x ad y values on the switches into memory just cuz
        if (state == 2'b00) begin
            x = sw[7:0];
            y = sw[15:8];
            #50
            state = 2'b01;
        end
        else if (state == 2'b10) state = 2'b00;
    end*/
    
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
            //Multiplication is done so display it
            //ok it should be displaying because of procedural assignment, so I guess we do nothing here?
        end
        else if (state == 2'b00) begin
            //clear out the out register once we're back at the begining
            //this will clear the LED's as well
            out[15:0] = 'b0;
        end
        
        if (btnC) begin
            if (state == 2'b00) begin
                x = sw[7:0];
                y = sw[15:8];
                #50
                state = 2'b01;
            end
            else if (state == 2'b10) state = 2'b00;
        end
    end
    
endmodule