# Hamming Code Detector

A Verilog-based implementation of a **Hamming (7,4) Code Detector** for detecting and correcting single-bit errors in transmitted data.

## Overview

Hamming Code is an error-correcting technique that adds parity bits to the original data. The receiver calculates a **syndrome** to determine whether an error has occurred and, if present, identifies the position of the erroneous bit.

This project implements the encoding, error detection, and correction process using Verilog HDL.

## Project Structure

- `hamming_encoder` – Generates the 7-bit Hamming code from 4 data bits.
- `hamming_decoder` – Calculates the syndrome and detects/corrects a single-bit error.
- `tb_hamming_code_detector` – Testbench for functional verification.
- `hamming_code_detector_sim.png` – Simulation waveform.
- `console_output.png` – Simulation console output.

## Working

For a **Hamming (7,4)** code:

- 4 bits are data bits.
- 3 bits are parity bits.
- Total codeword length is 7 bits.

The decoder calculates the syndrome using the parity bits. If the syndrome is `000`, no error is detected. A non-zero syndrome indicates the position of the erroneous bit, which can then be corrected.

```text
Data → Encoder → 7-bit Hamming Code
                    ↓
              Single-bit Error
                    ↓
             Hamming Decoder
                    ↓
              Syndrome Check
                    ↓
             Error Correction
                    ↓
             Original Data

 ```
 ## Tools Used

**Verilog HDL | QuestaSim**

## Author

**Chhavi Verma**

B.Tech Electronics Engineering  
