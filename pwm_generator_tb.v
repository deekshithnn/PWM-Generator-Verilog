`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2026 18:55:03
// Design Name: 
// Module Name: pwm_generator_tb
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

`timescale 1ns/1ps

module pwm_generator_tb;

    parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg [WIDTH-1:0] duty;

    wire pwm;

    // ==========================================
    // DUT
    // ==========================================

    pwm_generator #(
        .WIDTH(WIDTH)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm(pwm)
    );

    // ==========================================
    // CLOCK
    // ==========================================

    always #5 clk = ~clk;

    // ==========================================
    // TEST
    // ==========================================

    initial begin

        clk = 1'b0;
        rst = 1'b1;
        duty = 8'd0;

        // Reset
        #20;
        rst = 1'b0;

        // --------------------------------------
        // 25% DUTY CYCLE
        // --------------------------------------

        duty = 8'd64;

        $display("================================");
        $display("PWM TEST: 25%% DUTY");
        $display("DUTY = %d", duty);
        $display("================================");

        #2560;

        // --------------------------------------
        // 50% DUTY CYCLE
        // --------------------------------------

        duty = 8'd128;

        $display("================================");
        $display("PWM TEST: 50%% DUTY");
        $display("DUTY = %d", duty);
        $display("================================");

        #2560;

        // --------------------------------------
        // 75% DUTY CYCLE
        // --------------------------------------

        duty = 8'd192;

        $display("================================");
        $display("PWM TEST: 75%% DUTY");
        $display("DUTY = %d", duty);
        $display("================================");

        #2560;

        // --------------------------------------
        // FINISH
        // --------------------------------------

        $display("================================");
        $display("PWM SIMULATION COMPLETED");
        $display("================================");

        $finish;

    end

endmodule
