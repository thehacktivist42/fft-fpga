# 1024-Point Pipelined Zak-FFT Architecture (Verilog/FPGA)

![Language: SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog-blue.svg)
![Language: Python](https://img.shields.io/badge/Language-Python-green.svg)
![Language: MATLAB](https://img.shields.io/badge/Language-MATLAB-orange.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A streaming, fully-pipelined **1024-point Zak Transform (Zak-FFT)** core written in synthesizable SystemVerilog. The design is built around a **broadcast-and-decode polyphase demultiplexer**, a **ping-pong dual-port memory array**, and a **Single-path Delay Feedback (SDF)** FFT architecture. The datapath utilizes a highly optimized **Q20.12 fixed-point format**, preserving precision across all pipeline stages, achieving a Normalized RMSE (EVM) of ~0.0055% under randomized stress testing. The architecture is verified end-to-end against a double-precision MATLAB golden reference.

## Table of Contents
- [Architecture](#architecture)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Verification Methodology](#verification-methodology)
- [Design Notes](#design-notes)
- [Contributors](#contributors)

## Architecture

The core (`zak_top` in `zak_top.sv`) integrates three primary subsystems to compute the $M \times N$ transformation:

```text
in_real/imag ──▶ [Polyphase Demux] ─▶ [Ping-Pong Memory Banks] ─▶ [SDF FFT Pipeline] ──▶ out_real/imag
```

*   **Polyphase Demultiplexer** (`polyphase_demux.sv`): Instead of massive 1-to-M multiplexing, this module uses a **broadcast-and-decode** approach. Input data is routed to all memory banks simultaneously, while a one-hot write-enable decoder precisely selects the target bank (column) and address (row).
*   **Memory Bank Array** (`memory_bank_array.sv`): Instantiates `NUM_BANKS` dual-port distributed RAM blocks. It utilizes a **ping-pong buffering** scheme, allowing the FFT scheduler to seamlessly read an entire completed 2D grid while the demux fills the alternate buffer with the next incoming frame.
*   **Pipelined FFT Core** (`fft_pipelined.sv`): A multi-stage SDF commutator that reads from the memory array. To optimize for silicon area, early stages of the pipeline utilize a specialized `stage_trivial.sv` module to handle $W_2^0$, $W_4^0$, and $W_4^1$ (-j) twiddle factors using purely combinational add/sub/rotations, bypassing DSP-heavy complex multipliers entirely. 

## Features
- **Configurable Transform Matrices** — Parameterized to support multiple $M \times N$ configurations for a 1024-point transform (e.g., 64x16, 32x32, 16x64) by adjusting `NUM_BANKS` and `BANK_DEPTH`.
- **Broadcast-and-Decode Routing** — Eliminates heavy fan-out multiplexers at the input stage in favor of efficient one-hot write-enable decoding.
- **Q20.12 Fixed-Point Datapath** — 32-bit internal routing mathematically scaled to Q20.12 fractional precision, strictly minimizing quantization noise and preventing overflow during complex multiplications.
- **DSP-Optimized Edge Cases** — Automatically swaps in trivial butterfly modules for 2-point and 4-point pipeline stages, saving significant multiplier slices.
- **Automated Vivado Tcl Extraction** — Includes batch-mode scripts for headless synthesis and implementation, extracting accurate power, timing slack, and junction temperatures without heavy GUI memory overhead.
- **Continuous-flow execution** — Double-buffered ping-pong RAM with zero added stall cycles between 1024-sample frames.

## Repository Structure

| File / Directory | Description |
| :--- | :--- |
| 📄 `zak_top.sv` | Top-level DUT — instantiates the demux, memory array, FFT pipeline, and scheduler. |
| 📁 `submodules/` | `polyphase_demux.sv`, `memory_bank_array.sv`, `memory_bank.sv`, `fft_pipelined.sv`, `stage.sv`, `stage_trivial.sv` |
| 📄 `zak_top_tb.sv` | Top-level testbench: handles file I/O, Q20.12 bit-shifting (`temp_real << 12`), and drives the DUT cycle-by-cycle. |
| 📄 `zak_reference.m` | MATLAB golden-reference script — runs the corresponding $M \times N$ 2D transform and exports double-precision decimals. |
| 📄 `extract_metrics.tcl` | Headless Vivado batch script to synthesize, implement, and extract hardware metrics (LUTs, FFs, DSPs, Power, Slack) for Table III generation. |
| 📄 `generate_input.py` | Generates 1024 lines of space-separated complex input vectors (Ramp and Random). |
| 📁 `data/` | `input.txt` (stimulus), `hardware_output.txt` (RTL output scaled by 1/4096.0), `golden_reference.txt` (MATLAB output). |

## Prerequisites

* **Vivado (XSim)** or **Icarus Verilog** (`iverilog`) — RTL compilation/simulation (Strict Verilog-2001 compliance maintained in submodules to prevent XSim `generate` loop crashes).
* **MATLAB** (or GNU Octave) — golden-reference generation.
* **Python 3.x** — stimulus generation.

## Usage

**1. Generating Stimulus & Reference**
```bash
python3 generate_input.py
matlab -batch "run('zak_reference.m')"
python3 generate_twiddle.py # If the test runs a custom configuration other than the standard 32x32, thus requiring a different FFT width
```

**2. Simulation**

*Option A: Icarus Verilog (Recommended for macOS/Linux)*
```bash
iverilog -g2012 -I submodules -o zak_sim zak_top_tb.sv zak_top.sv
vvp zak_sim
```

*Option B: Vivado CLI (XSim)*
```bash
xvlog -sv zak_top.sv zak_top_tb.sv submodules/*.sv
xelab -debug typical -top tb_zak_top -snapshot zak_snapshot
xsim zak_snapshot -R
```

**3. Headless Synthesis & Implementation**
```bash
vivado -mode batch -source extract_metrics.tcl
```

**4. Verification and Error Anaylsis**
```bash
python3 check_zak.py
```

## Verification Methodology

1. **Stimulus generation** — `generate_input.py` writes 1024 space-separated complex test vectors (Ramp or Bounded Random).
2. **RTL simulation** — `zak_top_tb.sv` reads the text file, shifts the integers by 12 bits to convert them to Q20.12 format, and streams them into the DUT.
3. **Hardware Output** — The testbench divides the `out_real` and `out_imag` signals by `4096.0` to return them to floating-point representation, writing them to `hardware_output.txt`.
4. **Error analysis** — The hardware outputs are plotted and compared against `golden_reference.txt` to calculate Maximum Absolute Error, Mean Absolute Error, and the Error Vector Magnitude (EVM).

## Design Notes

- The system utilizes `wire` declarations instead of `logic` for all unpacked arrays driven by `generate` blocks and module boundaries (e.g., `mem_out_real`, `broadcast_real`) to bypass known Vivado XSim elaboration bugs.
- `stage_trivial.sv` accurately emulates the 2-cycle latency of the standard `complex_multiply.sv` block via shift registers, ensuring synchronization with the global `switch_d4` control signals remains tight.
- Unused twiddle ROMs in early stages are actively clamped to a size of `[0:0]` and tied off using `generate if` blocks to prevent synthesis crashes when $N/4$ resolves to $0$.

## Contributors
* **[@thehacktivist42](https://github.com/thehacktivist42)**
* **[@nakshatramiglani](https://github.com/nakshatramiglani)**
