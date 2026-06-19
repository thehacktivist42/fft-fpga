`timescale 1 ns / 1 ps

`define WIDTH 1024
`define SIZE 10
`define HALF_WIDTH (`WIDTH / 2)

`define DATA_WIDTH 32
`define TWIDDLE_WIDTH 16

`define OUT_WIDTH (`DATA_WIDTH + `TWIDDLE_WIDTH - 1 + `SIZE)

    module testbench_tb;
        reg [`DATA_WIDTH-1:0] A[`WIDTH-1:0];
        wire [`DATA_WIDTH-1:0] B[`WIDTH-1:0];
        wire signed [`OUT_WIDTH -1:0] out_real[`WIDTH-1:0];
        wire signed [`OUT_WIDTH -1:0] out_imag[`WIDTH-1:0];
        reg signed [`OUT_WIDTH -1:0] B_new_real[`WIDTH-1:0];
        reg signed [`OUT_WIDTH -1:0] B_new_imag[`WIDTH-1:0];
        wire done;
        integer i;

        real start_time;
        real end_time;
        real display_real;
        real display_imag;

        bit_reversal uut1(.in(A), .out(B));
        add_sub uut2(.in_real(B_new_real), .in_imag(B_new_imag), .out_real(out_real), .out_imag(out_imag), .done(done));
        always_comb begin
            for (i = 0; i < `WIDTH; i = i + 1) begin
                B_new_real[i] = $signed(B[i]) <<< (`TWIDDLE_WIDTH - 1);       
                B_new_imag[i] = {`OUT_WIDTH{1'sd0}};
            end
        end
        initial begin
            $dumpfile("test.vcd");
            $dumpvars(0, testbench_tb);
            $display("Test testbench");
            #5;
            start_time = $realtime;
            for(i = 0; i < `WIDTH; i = i + 1) begin
                A[i] = i; 
            end
            #10;
            end_time = $realtime;

            $display("Bit reversal module");
            for (i = 0; i < `WIDTH; i = i + 1) begin
                $display("%b %b", A[i], B[i]);
            end
            $display("Add-Sub");
            for (i = 0; i < `WIDTH; i = i + 1) begin

                display_real = $signed(out_real[i]);
                display_imag = $signed(out_imag[i]);

                if (display_imag < 0)
                    $display("%0d + 0j : %.4f - %.4f j", A[i], display_real / 32768.0, -display_imag / 32768.0);
                else
                    $display("%0d + 0j : %.4f + %.4f j", A[i], display_real / 32768.0, display_imag / 32768.0);
            end
            $display("Time: %0f ns", (end_time - start_time));
        end
        
    endmodule