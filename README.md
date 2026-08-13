# PWM Generator – Verilog HDL

A parameterized **Pulse Width Modulation (PWM) Generator** designed using
Verilog HDL and verified through RTL functional simulation using
**Xilinx Vivado XSim**.

The design generates a digital PWM waveform with a configurable duty cycle.
It uses a counter-based architecture and a comparator to control the PWM
output.

---

## 📌 Project Overview

Pulse Width Modulation (PWM) is widely used in digital and embedded systems
for applications such as:

- Motor speed control
- LED brightness control
- Servo control
- Power electronics
- Digital-to-analog conversion
- Embedded control systems

This project implements a simple and reusable PWM generator at the RTL level
using Verilog HDL.

---

## ✨ Features

- Parameterized PWM resolution
- Configurable duty cycle
- Counter-based PWM generation
- Comparator-based output control
- Synchronous reset
- Synthesizable RTL design
- Verilog testbench for functional verification
- Verified using Xilinx Vivado XSim

---

## 🏗️ Architecture

The PWM generator consists of two main functional blocks:

```text
              +----------------------+
              |      PWM Counter     |
              |                      |
        CLK ->|  0 → 255 → 0 → ...  |
              +----------+-----------+
                         |
                         | Counter
                         v
              +----------------------+
              |      Comparator      |
              |                      |
        Duty->| Counter < Duty       |
              +----------+-----------+
                         |
                         v
                     PWM Output

The PWM output is HIGH whenever:

Counter < Duty

Otherwise, the PWM output is LOW.

⚙️ Parameters

The design uses a configurable resolution parameter:

parameter WIDTH = 8

For an 8-bit configuration:

Counter Range = 0 to 255

This provides 256 possible duty-cycle levels.

📊 Duty Cycle Control

For an 8-bit PWM resolution:

Duty Input	Approx. Duty Cycle
8'd0	0%
8'd64	25%
8'd128	50%
8'd192	75%
8'd255	~100%

The duty cycle can be changed dynamically through the duty input.

🔌 Module Interface
Signal	Direction	Width	Description
clk	Input	1	System clock
rst	Input	1	Synchronous reset
duty	Input	WIDTH	PWM duty-cycle control
pwm	Output	1	Generated PWM waveform
💻 RTL Implementation

The main RTL module is:

pwm_generator.v

The module contains:

PWM counter
Duty-cycle comparator
Reset logic
PWM output generation
🧪 Verification

The design was verified using a dedicated Verilog testbench:

pwm_generator_tb.v

The testbench verifies multiple duty-cycle conditions:

25% Duty Cycle
       ↓
50% Duty Cycle
       ↓
75% Duty Cycle
Verification Values
Duty = 64   → 25%
Duty = 128  → 50%
Duty = 192  → 75%

The PWM waveform was inspected using the Vivado XSim waveform viewer.

📈 Expected Waveforms
25% Duty Cycle
PWM
     ┌───┐
     │   │
─────┘   └────────────────────
50% Duty Cycle
PWM
     ┌────────┐
     │        │
─────┘        └────────────────
75% Duty Cycle
PWM
     ┌──────────────┐
     │              │
─────┘              └──────────
🛠️ Tools & Technologies
Verilog HDL
Xilinx Vivado
XSim Simulator
RTL Design
Functional Simulation
Digital Design
📁 Project Structure
PWM-Generator-Verilog/
│
├── pwm_generator.v
├── pwm_generator_tb.v
├── README.md
│
└── screenshots/
    └── pwm_waveform.png
🎯 Learning Outcomes

This project demonstrates practical understanding of:

RTL design using Verilog HDL
Counters
Comparators
Parameterized modules
PWM generation
Duty-cycle control
Synchronous reset design
Testbench development
RTL functional simulation
Waveform analysis
🚀 Possible Future Improvements

The design can be extended with:

Configurable PWM frequency
Higher PWM resolution
Multiple PWM channels
Dead-time insertion
Complementary PWM outputs
Enable control
Center-aligned PWM
FPGA-based hardware implementation
👨‍💻 Author

Deekshith N N

Electronics and Communication Engineering

Areas of Interest
VLSI
RTL Design
Verilog HDL
Digital Electronics
Embedded Systems
FPGA Design
⭐ Project Status

Status: Completed and Functionally Verified

RTL Design       ✅
Testbench        ✅
Simulation       ✅
Waveform         ✅
Documentation    ✅
