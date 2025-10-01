# 📘 Verilog Lab: Traffic Light Controller  

## Objective  
This lab is designed to help you **review and practice the basics of Verilog HDL** through a simple but practical example: a **Traffic Light Controller**.  
By the end of this lab, you should be comfortable with:  
- Writing Verilog modules.  
- Using `reg` and `wire` types.  
- Creating sequential logic with `always` blocks.  
- Using `case` statements for state machines.  
- Writing a simple testbench to verify your design.  

---

## 📝 Problem Description  
We want to design a simple **traffic light controller** for a 2-way intersection:  

- **North-South (NS) road**  
- **East-West (EW) road**  

The traffic light should follow this sequence:  
1. **NS Green, EW Red**  
2. **NS Yellow, EW Red**  
3. **NS Red, EW Green**  
4. **NS Red, EW Yellow**  
(then repeat)  

Each light stays on for a fixed number of clock cycles (simulated as delays).  

---

## ⚙️ Design Specification  
- **Inputs:**  
  - `clk` : Clock signal.  
  - `reset` : Reset signal (active high).  

- **Outputs:**  
  - `NS_light` : 2-bit output for North-South road (`00=Red, 01=Green, 10=Yellow`).  
  - `EW_light` : 2-bit output for East-West road (`00=Red, 01=Green, 10=Yellow`).  

- **State Machine States:**  
  - `S0`: NS Green, EW Red  
  - `S1`: NS Yellow, EW Red  
  - `S2`: NS Red, EW Green  
  - `S3`: NS Red, EW Yellow  

---

## 🔑 Key Verilog Concepts Recap  
1. **Modules** – Basic building blocks in Verilog.  
2. **Reg vs Wire** – `reg` holds values inside procedural blocks, `wire` connects signals.  
3. **Always Block** – Used for describing sequential or combinational logic.  
4. **Case Statement** – Great for implementing finite state machines (FSM).  
5. **Reset Logic** – Ensures the design starts in a known state.  
6. **Testbench** – Simulates the design without synthesis.  

---
