module traffic_light (
    input  wire clk,
    input  wire reset,
    output reg [1:0] NS_light, // 00=Red, 01=Green, 10=Yellow
    output reg [1:0] EW_light  // 00=Red, 01=Green, 10=Yellow
);

    // State encoding
    localparam  S0 = 2'b00,  // NS Green, EW Red
                S1 = 2'b01,  // NS Yellow, EW Red
                S2 = 2'b10,  // NS Red, EW Green
                S3 = 2'b11;   // NS Red, EW Yellow;

    reg[1:0] state, next_state;
    reg [3:0] timer; // simple counter for delay (4-bit)

    // Sequential logic: state + timer update
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            timer <= 4'd0;
        end else begin
            if (timer == 4'd9) begin // stay 10 cycles per state
                state <= next_state;
                timer <= 4'd0;
            end else begin
                timer <= timer + 1;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            S0: begin NS_light = 2'b01; EW_light = 2'b00; end // NS Green
            S1: begin NS_light = 2'b10; EW_light = 2'b00; end // NS Yellow
            S2: begin NS_light = 2'b00; EW_light = 2'b01; end // EW Green
            S3: begin NS_light = 2'b00; EW_light = 2'b10; end // EW Yellow
            default: begin NS_light = 2'b00; EW_light = 2'b00; end
        endcase
    end

endmodule
