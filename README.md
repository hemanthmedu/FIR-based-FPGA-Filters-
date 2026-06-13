#FPGA-Based Real-Time FIR Filter Design for ECG Signal Processing

**Course:** DDHDL Verilog (22ECE42) | **Semester:** 4th | **Institution:** St. Joseph Engineering College, Mangaluru

| Student | USN |
|---|---|
| Hemanth | 4SO24EC042 |
| Ethan Ranger | 4SO24EC033 |
| Dhathri P G | 4SO24EC030 |
| Deeksha K | 4SO24EC029 |

**Guide:** P.C Vijay Ganesh (Asst. Professor, B.E, M.Tech, MIEEE)

---

## Table of Contents
1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Objectives](#objectives)
4. [Literature Review](#literature-review)
5. [Results](#results)
6. [Tools Used](#tools-used)
7. [References](#references)

---

## Introduction

Real-time biomedical monitoring (ECG, gas sensors) requires digital filtering before signal analysis. ECG signals are often corrupted by:
- Powerline interference (50/60 Hz)
- Motion artifacts
- High-frequency disturbances
- Baseline drift

**Why FPGA over MCU/DSP?**

| Feature | Software (MCU/DSP) | FPGA |
|---|---|---|
| Processing | Sequential | Parallel |
| Latency | High | Low |
| Power | Higher | Lower |
| Reconfigurability | Limited | High |

FPGAs enable hardware-level parallelism and pipelining, making them ideal for real-time FIR filtering in wearable/IoT devices.

---

## Problem Statement

> Design and implement an FPGA-based hardware system capable of performing real-time digital filtering for streaming input ECG data — overcoming the latency and power issues of software-based approaches.

---

## Objectives

- Implement pipelined FIR filter with parallel processing
- Use shift registers, coefficient ROM, multipliers, and adder trees
- Minimize power consumption for portable/wearable devices
- Optimize FPGA resource usage (LUTs, FFs, DSP blocks)
- Support LPF + HPF + Notch filter cascade
- Provide scalable and reconfigurable architecture

---
Comparative Analysis Table
<img width="470" height="143" alt="Screenshot 2026-05-12 024144" src="https://github.com/user-attachments/assets/cb009c82-a272-4763-8b0f-58feda1a74ad" />

### Research Gap
Existing MCU-based systems suffer from high latency, limited speed, high power, and no parallel processing. This project addresses these with a **high-speed, low-power FPGA pipelined FIR system**.

---

## Proposed System Design

### Design Justification

**1. FPGA-Based High Performance**
- Replaces MCU-based FIR (high latency & power)
- Enables parallel processing
- Suitable for wearables/IoT

**2. Multi-Stage ECG Filtering (LPF → Notch → HPF)**
- LPF: Removes high-frequency noise
- Notch (50/60 Hz): Removes powerline interference
- HPF: Removes baseline drift

**3. Pipelined Architecture**
- Z⁻¹ delay elements reduce critical path delay
- Enables continuous high-speed processing

**4. Optimized Hardware (CSD/DA multipliers + CSA adder tree)**
- Reduces area, power, and switching activity

**5. Flexible System Control**
- Coefficient ROM/LUT for different filter types
- Buffers + control unit for synchronization

---

### Block Diagram

```
                        ┌─────────────────────────────────────────┐
                        │              FPGA (Xilinx)              │
                        │           ┌─ FIR Filter Core ─┐        │
Digital ECG  ──► Input  │    ┌─────┐ │  ┌─────┐ ┌──────┐│ Output │──► Digital
  Input          Buffer │───►│ LPF │─┼─►│Notch│─►│ HPF  ││ Buffer │     Output
                        │    └─────┘ │  └─────┘ └──────┘│        │
                        │            └───────────────────┘        │
                        │    ┌──────────────────────────────┐     │
                        │    │   Coefficient ROM / LUT       │     │
                        │    └──────────────────────────────┘     │
                        │    ┌──────────────────────────────┐     │
                        │    │  Control Unit                 │     │
                        │    │  (Timing, Handshaking)        │     │
                        │    └──────────────────────────────┘     │
                        └─────────────────────────────────────────┘
```
<img width="536" height="319" alt="Screenshot 2026-05-11 223034" src="https://github.com/user-attachments/assets/c1327725-09b4-41d9-8e06-b1541a16b273" />

---

### Architecture Diagram

```
Digital ECG Input
        │
        ▼
  ┌──────────┐    ┌────────────┐    ┌───────────────┐
  │ Shift Reg│───►│ Coeff ROM  │───►│  Multiplier   │
  │  Z⁻¹    │    │  N.0       │    │  (CSD/DA)     │──┐
  └──────────┘    └────────────┘    └───────────────┘  │
  ┌──────────┐    ┌────────────┐    ┌───────────────┐  │   ┌──────────────┐
  │ Shift Reg│───►│ Coeff ROM  │───►│  Multiplier   │──┼──►│  Adder Tree  │
  │  Z⁻¹    │    │  N.1       │    │  (CSD/DA)     │  │   │  (CSA/XOR)  │
  └──────────┘    └────────────┘    └───────────────┘  │   │      │       │
        ...              ...               ...          │   │     Z⁻¹     │
  ┌──────────┐    ┌────────────┐    ┌───────────────┐  │   │      │       │
  │ Shift Reg│───►│ Coeff ROM  │───►│  Multiplier   │──┘   │      Σ      │
  │  Z⁻¹    │    │  N.7       │    │  (CSD/DA)     │      └──────┬───────┘
  └──────────┘    └────────────┘    └───────────────┘             │
                                                                   ▼
                        ┌───────────────────────────────┐   Digital Output
                        │         Control Unit           │
                        │  System Clock | Coeff Addr Gen │
                        │  Pipeline Timing Control       │
                        └───────────────────────────────┘
```
<img width="547" height="328" alt="Screenshot 2026-05-11 224656" src="https://github.com/user-attachments/assets/39bbf93e-7c9e-4a4b-9217-c8e0c1e89d76" />

---Implementation Flow:
  ECG Dataset
     |
     ↓
MATLAB Preprocessing
     |
     ↓
12-bit Digital Samples
     |
     ↓
Vivado Simulation
     |
     ↓
Verilog FIR Implementation
     |
     ↓
Filtered ECG Output

## Leaf Cell Design

### 4.1 Identified Leaf Cells

| # | Block | Leaf Cells |
|---|---|---|
| 1 | Shift Register (Z⁻¹) | D Flip-Flops, Clock Buffers, AND (Enable) |
| 2 | Coefficient ROM | Memory cells, Address Decoder, Word/Bit line drivers, Sense Amplifiers |
| 3 | Multiplier Block | AND gates, Half/Full Adders, Booth Encoder, Shifter |
| 4 | Adder Tree (CSA/XOR-MUX) | Full/Half Adders, XOR gates, MUX, CSA units |
| 5 | Pipeline Registers (Z⁻¹) | D Flip-Flops, Clock Gating Cells |

---

### 1. Shift Register Block (Z⁻¹ Delays)

**Purpose:** Store past N input samples for FIR convolution.

**RTL Diagram:**
```
      rst
       │
clk ──►│  CLR
       │   C     Q ──────────────► dout
en  ──►│   CE
din ──►│   D
       │
   shift_reg[11:0]
   (RTL_REG_ASYNC)
```

**Behavior:**
- `rst=1` → All 12 bits cleared to 0
- `en=1` → On each rising `clk`, data shifts: `din` enters, oldest bit exits as `dout`
- `en=0` → Register holds current value
- Output = input delayed by **12 clock cycles**

**Components:**
- **D Flip-Flop:** Stores 1 bit; updates only on clock edge
- **Clock Buffer:** Distributes clock evenly; reduces skew/delay
- **Enable Logic (AND gate):** Allows shifting only when `en=1`

---

### 2. Coefficient ROM

**Purpose:** Store fixed FIR filter weights (coefficients).

**RTL Diagram:**
```
             data[11:6]_OBUF_inst
              I ──[OBUF]──────────────► data[11:0]
              ═══════════════════════════════════
addr[2:0] ──► A[2:0]  O[5:0]  ──5:0──►
              RTL_ROM
              (data_i)
```

**Behavior:**
- 3-bit address → selects 1 of 8 memory locations
- Outputs predefined 6-bit coefficient data
- Data sent to output through buffer (OBUF)

**Components:**
- **Memory Cells (ROM/SRAM):** ROM = fixed values; SRAM = read/write
- **Address Decoder:** Selects row from address input
- **Word/Bit Line Drivers:** Activate rows; carry data in/out
- **Sense Amplifiers:** Amplify small voltage differences for accurate read

---

### 3. Multiplier Block

**Purpose:** Multiply each input sample with the corresponding filter coefficient.

#### AND Gate (Partial Product Generation)
```
a ──────►│
         │ RTL_AND ──► y_i ──[OBUF]──► y
b ──────►│
```
Truth table: `y = a AND b` (output 1 only when both inputs are 1)

#### Half Adder (HA)
```
A ──────►│ RTL_AND ──►─── Carry_i ──[OBUF]──► Carry
B ──────►│
         │ RTL_XOR ──►─── Sum_i   ──[OBUF]──► Sum
```
- `Sum = A XOR B`
- `Carry = A AND B`

#### Full Adder (FA)
```
A, B, Cin ──► [XOR + AND + OR tree] ──► Sum, Cout
```
- `Sum = A XOR B XOR Cin`
- `Cout = 1` when at least 2 inputs are 1
---

### 4. Adder Tree (CSA / XOR-MUX)

**Purpose:** Sum all partial products from multipliers efficiently.

#### XOR Gate
```
a ──────►│
         │ RTL_XOR ──► y_i ──[OBUF]──► y
b ──────►│
```
- Output = 1 only when inputs **differ**
- Core of sum calculation in all adders

#### 2-to-1 MUX
```
b ──── S=1'b1 ──►│
                  │ RTL_MUX ──► y_i ──[OBUF]──► y
a ─── default ──►│
sel ─────────────┘
```
- `sel=0` → output = `a`
- `sel=1` → output = `b`
- Used for tap selection and data routing

#### Carry Save Adder (CSA)
```
a, b, c ──► [XOR + AND/OR] ──► sum (XOR), carry (AND/OR)
```
- Adds **3 numbers simultaneously** without carry propagation
- Carry is "saved" and passed to next stage
- Much faster than ripple-carry in multi-operand addition (FIR adder trees)

```
a ──►│ RTL_XOR ──► sum0_i ──►│                ┌──► carry
b ──►│            carry1_i ──►│ RTL_AND ──►    │
c ──►│ RTL_AND ──► carry0_i──►│ RTL_OR  ──────┘
                               │ RTL_XOR ──────► sum
```

---

### 5. Pipeline Registers (Z⁻¹ inside Adder Tree)

**Purpose:** Break long combinational paths; enable high clock frequency.

#### D Flip-Flop
Same as in Shift Register — stores 1 bit, updates on clock edge.

#### Clock Gating Cell
```
clk ──►│
        │ AND ──► gclk ──► [D-FF CLR/C/D/Q] ──► q
en  ──►│
rst ──────────────────────────────────────────► (async clear)
```
- `gclk = clk AND en`
- When `en=0` → no clock reaches FF → holds value → **saves power**
- When `en=1` → FF updates normally on clock edge
- `rst=1` → output cleared to 0 asynchronously

---Input ECG Explanation:
The ECG signal is obtained from a public ECG dataset.
The analog ECG waveform is considered digitized using a 12-bit ADC.

The digitized samples are provided to the FPGA FIR filter through
the data_in[11:0] input port.

During simulation, ECG samples are applied through the Verilog testbench.

## Results

| Metric | Outcome |
|---|---|
| Noise Removal | Clear reduction in powerline interference, HF noise, baseline drift |
| Latency | Low — due to pipelined architecture |
| Speed | High — parallel processing |
| Power | Reduced vs MCU-based systems |
| Resource Usage | Optimized LUTs, FFs; CSA tree reduces delay |
| Signal Clarity | Accurate cardiac feature preservation |
| Reliability | Stable continuous processing with synchronization |

Overall Formula
<img width="784" height="605" alt="IMG-20260512-WA0000 (1)" src="https://github.com/user-attachments/assets/5ebc0e1f-d198-484b-84ea-859383157984" />



**Application Scope:**
- Wearable ECG monitoring devices
- Remote health monitoring systems
- Real-time biomedical signal processing

- Limitations
Current implementation uses fixed coefficients.
Filter performance depends on selected coefficients.
Hardware testing on FPGA board is not included in the current simulation stage.
Real-time ADC interface can be added in future work.

---
Future Scope

Implement adaptive FIR filtering.
Add real-time ECG sensor interface.
Implement LPF, HPF, and Notch filter cascade.
Optimize multiplier architecture using Booth/CSD techniques.
Deploy on FPGA development board.

## Tools Used

| Tool | Purpose |
|---|---|
| **MATLAB** | FIR coefficient design, simulation |
| **Vivado (Xilinx)** | RTL design, synthesis, HDL simulation, waveform viewing |

---

## References

[1] P. C. Bhaskar and M. D. Uplane, "FPGA Based Digital FIR Multilevel Filtering For ECG Denoising," *ICIP 2015*, Pune, India, pp. 733–738.

[2] M. Prabhavathy and S. M. Sakthivel, "VLSI Implementation of CSD Based Efficient FIR Filter for ECG Signal Denoising," *IEEE VLSI SATA 2024*, doi: 10.1109/VLSISATA61709.2024.10560274.

[3] B. Sriram et al., "Strategic Reduction of Area and Power in FIR Filter Architecture for ECG Signal Acquisition," *SMART 2025*, pp. 574–578, doi: 10.1109/SMART66937.2025.11389312.

[4] R. Rasu et al., "FPGA Based Non-Invasive Heart Rate Monitoring System for Detecting Abnormalities in Fetal," *SPACES 2015*, pp. 375–379.

[5] L. Nian-qiang et al., "Application of Distributed FIR Filter Based on FPGA in the Analyzing of ECG Signal," *ISDEA 2010*, pp. 335–338, doi: 10.1109/ISDEA.2010.265.

[6] B. Singh, R. Mehra, and Chandni, "Reconfigurable FIR Filter for Denoising of ECG Signal," *IEEE NITTTR 2016*.

[7] S. Sumathi et al., "Arrhythmia Detection and ECG Signal Analysis using Digital Filtering Techniques," *ICCES 2022*, pp. 6–11, doi: 10.1109/ICCES54183.2022.9835793.

[8] T. Singh et al., "ECG Baseline Noise Removal Techniques Using Window Based FIR Filters," *MedCom 2014*, pp. 131–136.

