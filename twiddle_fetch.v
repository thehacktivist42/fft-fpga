`timescale 1 ns / 1 ps

`define WIDTH 16
`define SIZE $clog2(`WIDTH)
`define HALF_WIDTH (`WIDTH / 2)
`define QUARTER_WIDTH (`WIDTH / 4)

`define DATA_WIDTH 16
`define TWIDDLE_WIDTH 16

module twiddle_factors(
    input logic clk,
    input logic rst_n,
    input logic [`SIZE - 2:0] angle_idx,
    output logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_real, 
    output logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_imag
);
    (* ram_style = "distributed" *) logic signed [`TWIDDLE_WIDTH - 1 : 0] rom_real [0:`QUARTER_WIDTH - 1];
    (* ram_style = "distributed" *) logic signed [`TWIDDLE_WIDTH - 1 : 0] rom_imag [0:`QUARTER_WIDTH - 1];

    initial begin
        $readmemh("data/fft/twiddles_real.hex", rom_real);
        $readmemh("data/fft/twiddles_imag.hex", rom_imag);
    end

    logic signed [`TWIDDLE_WIDTH - 1:0] raw_r, raw_i;
    logic swap_flag;

    always_ff @(posedge clk) begin
        raw_r <= rom_real[angle_idx[`SIZE - 3:0]];
        raw_i <= rom_imag[angle_idx[`SIZE - 3:0]];
        swap_flag <= angle_idx[`SIZE - 2];
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            twiddle_real <= 0;
            twiddle_imag <= 0;
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