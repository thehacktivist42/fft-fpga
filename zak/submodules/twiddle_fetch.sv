module twiddle_factors #(
    parameter WIDTH = 16,
    parameter TWIDDLE_WIDTH = 16
)(
    input wire clk,
    input wire rst_n,
    input wire [$clog2(WIDTH)-2:0] angle_idx,
    input wire signed [TWIDDLE_WIDTH-1:0] rom_real [0:WIDTH/4-1],
    input wire signed [TWIDDLE_WIDTH-1:0] rom_imag [0:WIDTH/4-1],
    output reg signed [TWIDDLE_WIDTH-1:0] twiddle_real,
    output reg signed [TWIDDLE_WIDTH-1:0] twiddle_imag
);

    localparam SIZE = $clog2(WIDTH);

    reg signed [TWIDDLE_WIDTH-1:0] raw_r;
    reg signed [TWIDDLE_WIDTH-1:0] raw_i;
    reg swap_flag;

    always_ff @(posedge clk) begin
        raw_r <= rom_real[angle_idx[SIZE-3:0]];
        raw_i <= rom_imag[angle_idx[SIZE-3:0]];
        swap_flag <= angle_idx[SIZE-2];
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            twiddle_real <= '0;
            twiddle_imag <= '0;
        end
        else begin
            if (swap_flag) begin
                twiddle_real <= raw_i;
                twiddle_imag <= -raw_r;
            end
            else begin
                twiddle_real <= raw_r;
                twiddle_imag <= raw_i;
            end
        end
    end

endmodule