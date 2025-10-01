`timescale 1ns/1ps

module traffic_light_tb;

    reg clk;
    reg reset;
    wire [1:0] NS_light;
    wire [1:0] EW_light;

    // Instantiate DUT
    traffic_light dut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Dump waves (for GTKWave)
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);

        // Initialize
        clk = 0;
        reset = 1;

        // Hold reset for a few cycles
        #20 reset = 0;

        // Run simulation for 200 cycles
        #200 $stop;
    end

    // Monitor output
    initial begin
        $display("Time\tNS\tEW");
        $monitor("%0t\t%b\t%b", $time, NS_light, EW_light);
    end

endmodule
