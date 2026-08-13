`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2026 18:53:16
// Design Name: 
// Module Name: pwm_generator
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
`timescale 1ns/1ps

module pwm_generator #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire             rst,
    input  wire [WIDTH-1:0] duty,
    output reg              pwm
);

    reg [WIDTH-1:0] counter;

    always @(posedge clk) begin

        if (rst) begin
            counter <= 0;
            pwm     <= 0;
        end

        else begin

            // PWM counter
            if (counter == {WIDTH{1'b1}})
                counter <= 0;
            else
                counter <= counter + 1'b1;

            // Compare counter with duty cycle
            if (counter < duty)
                pwm <= 1'b1;
            else
                pwm <= 1'b0;

        end

    end

endmodule
