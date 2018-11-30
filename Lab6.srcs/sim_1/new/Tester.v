`timescale 1ns / 1ps

module Tester();
    reg clock, state;
    reg [7:0] x, y;
    wire [15:0] out;

    Multiplier mult(
        .x(x),
        .y(y),
        .clock(clock),
        .state(state),
    
        .out(out)
    );
    
    initial begin
    //To test, set x and y to whatever 8-bit binary values you want to test, and run the simulation
        state = 0; clock = 0; x = 8'b00001111; y = 8'b10001000;
        #50
        state = 1;
        #50
        clock = 1;
        #50
        clock = 0;
    end

endmodule
