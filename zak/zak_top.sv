`include "submodules/polyphase_demux.sv"
`include "submodules/memory_bank_array.sv"
`include "submodules/scheduler.sv"
`include "submodules/output_formatter.sv"
`include "fft_pipelined.sv"

`timescale 1 ns / 1 ps
module zak_top #(
    parameter WIDTH = 1024,
    parameter IN_WIDTH = 32,
    parameter NUM_BANKS = 32,  
    parameter BANK_DEPTH = 32 
)(
    input wire clk,
    input wire rst_n,
    input wire signed [IN_WIDTH-1:0] in_real,
    input wire signed [IN_WIDTH-1:0] in_imag,
    output wire signed [IN_WIDTH-1:0] out_real,
    output wire signed [IN_WIDTH-1:0] out_imag,
    output wire out_valid
);

    // Demux to Array/Scheduler
    wire signed [IN_WIDTH-1:0] broadcast_real;
    wire signed [IN_WIDTH-1:0] broadcast_imag;
    wire [NUM_BANKS-1:0]       bank_we;
    wire [$clog2(BANK_DEPTH)-1:0] bank_waddr;
    wire [$clog2(WIDTH):0]     counter;
    wire                       frame_done;
    wire                       ping_pong_select; 

    polyphase_demux #(
        .IN_WIDTH(IN_WIDTH),
        .WIDTH(WIDTH),
        .NUM_BANKS(NUM_BANKS),
        .BANK_DEPTH(BANK_DEPTH)
    ) u_demux (
        .clk(clk),
        .rst_n(rst_n),
        .in_real(in_real),
        .in_imag(in_imag),
        .broadcast_real(broadcast_real),
        .broadcast_imag(broadcast_imag),
        .bank_we(bank_we),
        .bank_waddr(bank_waddr),
        .counter(counter),
        .frame_done(frame_done),
        .ping_pong_select(ping_pong_select)
    );

    // Scheduler to Array
    wire [$clog2(NUM_BANKS)-1:0]  bank_select;
    wire [$clog2(BANK_DEPTH)-1:0] bank_raddr;
    wire [NUM_BANKS-1:0]          bank_re;
    wire                          ping_pong_sel_r;
    wire                          read_valid;

    scheduler #(
        .WIDTH(WIDTH),
        .NUM_BANKS(NUM_BANKS),
        .BANK_DEPTH(BANK_DEPTH)
    ) u_scheduler (
        .clk(clk),
        .rst_n(rst_n),
        .counter(counter),
        .bank_select(bank_select),
        .bank_raddr(bank_raddr),
        .bank_re(bank_re),
        .ping_pong_sel_r(ping_pong_sel_r),
        .read_valid(read_valid)
    );

    // Array to FFT
    wire signed [IN_WIDTH-1:0] fft_in_real;
    wire signed [IN_WIDTH-1:0] fft_in_imag;

    memory_bank_array #(
        .IN_WIDTH(IN_WIDTH),
        .NUM_BANKS(NUM_BANKS),
        .BANK_DEPTH(BANK_DEPTH)
    ) u_mem_array (
        .clk(clk),
        .ping_pong_sel_w(ping_pong_select),
        .ping_pong_sel_r(ping_pong_sel_r),
        .in_real(broadcast_real),
        .in_imag(broadcast_imag),
        .bank_we(bank_we),
        .bank_waddr(bank_waddr),
        .bank_select(bank_select),
        .bank_raddr(bank_raddr),
        .bank_re(bank_re),
        .out_real(fft_in_real),
        .out_imag(fft_in_imag)
    );

    reg [$clog2(BANK_DEPTH)-1:0] bank_raddr_d;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bank_raddr_d <= '0;
        end else begin
            bank_raddr_d <= bank_raddr;
        end
    end

    // FFT to Output Formatter
    wire signed [IN_WIDTH-1:0] fft_out_real;
    wire signed [IN_WIDTH-1:0] fft_out_imag;
    wire [$clog2(BANK_DEPTH) - 1:0] fft_sample_count_out;

    fft_top #(
        .WIDTH(BANK_DEPTH),
        .IN_WIDTH(IN_WIDTH),
        .TWIDDLE_WIDTH(16)
    ) fft_inst (
        .clk(clk),
        .rst_n(rst_n),
        .in_real(fft_in_real),
        .in_imag(fft_in_imag),
        .sample_count(bank_raddr_d),
        .out_real(fft_out_real),
        .out_imag(fft_out_imag),
        .out_sample_count(fft_sample_count_out)
    );

    output_formatter #(
        .IN_WIDTH(IN_WIDTH),
        .FFT_WIDTH(BANK_DEPTH)
    ) output_formatter_inst (
        .clk(clk),
        .rst_n(rst_n),
        .fft_in_real(fft_out_real),
        .fft_in_imag(fft_out_imag),
        .fft_sample_count(fft_sample_count_out),
        .zak_out_real(out_real),
        .zak_out_imag(out_imag),
        .out_valid(out_valid)
    );

endmodule