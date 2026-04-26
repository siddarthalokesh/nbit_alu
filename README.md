# 🔢 N-Bit ALU Design in Verilog

## 📌 Overview

This project implements a **parameterized N-bit Arithmetic Logic Unit (ALU)** in Verilog.
The ALU performs arithmetic, logical, shift, and comparison operations based on a 4-bit opcode and generates status flags.

---

## ⚙️ Features

* Parameterized data width (`N`)
* 4-bit opcode control (`K = 4`)
* 16 operations supported
* Fully combinational design
* Status Flags:

  * Carry (C)
  * Zero (Z)
  * Sign (S)
  * Overflow (V)

---

## 🧠 ALU Operations Table

| Hex | Opcode | Operation                        |
| --- | ------ | -------------------------------- |
| 0x0 | 0000   | ADD (A + B)                      |
| 0x1 | 0001   | SUB (A - B)                      |
| 0x2 | 0010   | DIVIDE(A / B)                    |
| 0x3 | 0011   | MULTIPLY (A * B)                 |
| 0x4 | 0100   | AND (A & B)                      |
| 0x5 | 0101   | OR (A or B)                      |
| 0x6 | 0110   | XOR (A ^ B)                      |
| 0x7 | 0111   | NOT A (~A)                       |
| 0x8 | 1000   | Shift Left (A << 1)              |
| 0x9 | 1001   | Shift Right (A >> 1)             |
| 0xA | 1010   | Arithmetic Shift Right (A >>> 1) |
| 0xB | 1011   | Rotate Left                      |
| 0xC | 1100   | PASS A                           |
| 0xD | 1101   | PASS B                           |
| 0xE | 1110   | Compare (A == B)                 |
| 0xF | 1111   | ZERO (Output = 0)                |

---

## 📁 Project Structure

```text
nbit_alu/
 ├── alu.v        # ALU design
 ├── alu_tb.v     # Testbench
 └── README.md
```

---

## 🧪 Simulation

* Tool: Xilinx Vivado
* Testbench verifies all operations
* Functional correctness validated using waveform analysis

---

## ▶️ How to Run

1. Open Vivado/Modelsim/EDA Playground
2. Add `alu.v` and `alu_tb.v`
3. Run Behavioral Simulation
4. Observe waveform outputs

---

## 📊 Flags Description

* **Carry (C):** Set during arithmetic overflow (unsigned)
* **Zero (Z):** Set when output = 0
* **Sign (S):** MSB of result
* **Overflow (V):** (Currently not implemented)

---

## ⚠️ Notes

* Some operations (e.g., `A ^ 1`, `A * 1`) are included for opcode completeness but can be optimized or replaced in future versions.
* Overflow flag is declared but not fully implemented.

---

## 💡 Future Improvements

* Implement proper overflow detection
* Replace weak operations with INC/DEC
* Add shift-by-N and barrel shifter
* Add comparison operators (>, <)

---

## 👨‍💻 Author

**Siddarth Lokesh**
