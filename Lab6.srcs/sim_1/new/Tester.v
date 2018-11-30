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
        state = 0; clock = 0; x = 'h00; y = 'hAE;
        #50
        state = 1;
        #50
        clock = 1;
        #50
        clock = 0;
        #50
        state = 0;
        #50
        x = 'h01; y = 'hAE;
        #50
        state = 1;
        #50
        clock = 1;
        #50
        clock = 0;
        #50
        state = 0;
        #50
        x = 'hAE; y = 'h01;
        #50
        state = 1;
        #50
        clock = 1;
        #50
        clock = 0;
        #50
        state = 0;
    end

endmodule
