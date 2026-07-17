`timescale 1 ns / 1 ps

module output_formatter #(
    parameter IN_WIDTH = 32,
    parameter FFT_WIDTH = 32 // the N in the M x N representation of the transform (depth of each bank)
)(
    // Control signals
    input wire clk,
    input wire rst_n,
    /*input wire valid_in,*/ // Keeping this, just in case we decide to add a valid_in signal (we should ideally)

    // Data inputs
    input wire signed [IN_WIDTH - 1:0] fft_in_real,
    input wire signed [IN_WIDTH - 1:0] fft_in_imag,
    input wire [$clog2(FFT_WIDTH) - 1:0] fft_sample_count, // stage_count from FFT output

    // Data outputs
    output wire signed [IN_WIDTH - 1:0] zak_out_real,
    output wire signed [IN_WIDTH - 1:0] zak_out_imag,
    output wire out_valid // Goes HIGH when the first valid corrected frame begins streaming
);

    localparam ADDR_BITS = $clog2(FFT_WIDTH);
    localparam SCALING_FACTOR = ADDR_BITS;

    // Bit-reversal
    wire [ADDR_BITS - 1:0] bit_rev_addr;
    genvar i;
    generate
        for (i = 0; i < ADDR_BITS; i++) begin: gen_bit_reverse
            assign bit_rev_addr[i] = fft_sample_count[ADDR_BITS - 1 - i];
        end
    endgenerate

    // 64-deep ping-pong buffer
    reg signed [IN_WIDTH - 1:0] mem_real [0:(FFT_WIDTH*2)-1];
    reg signed [IN_WIDTH - 1:0] mem_imag [0:(FFT_WIDTH*2)-1];

    reg ping_pong_w;
    reg ping_pong_r;
    reg [ADDR_BITS - 1:0] read_count;

    reg pipeline_full; // Tracks when the first full FFT frame is written

    // Write-side addressing (Bit-reversed)
    wire [ADDR_BITS:0] physical_waddr;
    assign physical_waddr = {ping_pong_w, bit_rev_addr};

    // Read-side addressing (Natural order)
    wire [ADDR_BITS:0] physical_raddr;
    assign physical_raddr = {ping_pong_r, read_count};

    wire pipeline_full_d;
    wire [ADDR_BITS-1:0] read_count_out;

    assign out_valid = pipeline_full;
    assign read_count_out = read_count;

    wire signed [IN_WIDTH - 1:0] scaled_real = mem_real[physical_raddr];
    wire signed [IN_WIDTH - 1:0] scaled_imag = mem_imag[physical_raddr];

    assign zak_out_real = out_valid ? scaled_real : '0;
    assign zak_out_imag = out_valid ? scaled_imag : '0;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ping_pong_r <= 1'b0;
            ping_pong_w <= 1'b0;
            read_count <= '0;
            pipeline_full <= 1'b0;
        end
        else begin
            // Write logic
            mem_real[physical_waddr] <= fft_in_real;
            mem_imag[physical_waddr] <= fft_in_imag;
            if (fft_sample_count == FFT_WIDTH - 1) begin
                ping_pong_w <= ~ping_pong_w;
                pipeline_full <= 1'b1;
            end

            // Read logic
            if (pipeline_full) begin
                if (read_count == FFT_WIDTH - 1) begin
                    read_count <= '0;
                    ping_pong_r <= ~ping_pong_r;
                end
                else begin
                    read_count <= read_count + 1;
                end
            end
        end
    end

endmodule