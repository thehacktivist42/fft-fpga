module complex_multiply #(
    parameter FFT_WIDTH = 36,
    parameter TWIDDLE_WIDTH = 16
)(
    input wire clk,
    input wire rst_n,

    input wire signed [TWIDDLE_WIDTH-1:0] mul1_real,
    input wire signed [TWIDDLE_WIDTH-1:0] mul1_imag,

    input wire signed [FFT_WIDTH-1:0] mul2_real,
    input wire signed [FFT_WIDTH-1:0] mul2_imag,

    output reg signed [FFT_WIDTH-1:0] out_real,
    output reg signed [FFT_WIDTH-1:0] out_imag
);
    localparam PROD_WIDTH = FFT_WIDTH + TWIDDLE_WIDTH;
    localparam SUM_WIDTH  = PROD_WIDTH + 1;
    reg signed [PROD_WIDTH-1:0] prr, pii, pri, pir;
    wire signed [SUM_WIDTH-1:0] real_full, imag_full;
    localparam signed [SUM_WIDTH-1:0] round_val = SUM_WIDTH'(1) << (TWIDDLE_WIDTH - 2);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prr <= '0;
            pii <= '0;
            pri <= '0;
            pir <= '0;
        end
        else begin
            prr <= mul1_real * mul2_real;
            pii <= mul1_imag * mul2_imag;
            pri <= mul1_real * mul2_imag;
            pir <= mul1_imag * mul2_real;
        end
    end

    assign real_full = prr - pii;
    assign imag_full = pri + pir;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_real <= '0;
            out_imag <= '0;
        end
        else begin
            out_real <= (real_full + round_val) >>> (TWIDDLE_WIDTH - 1);
            out_imag <= (imag_full + round_val) >>> (TWIDDLE_WIDTH - 1);
        end
    end

endmodule