# FSM
mealy 1001 sequence detection using verilog
1001 Sequence Detector (Mealy FSM)

This project implements a Mealy finite state machine (FSM) to detect the serial bit sequence 1001.
In a Mealy machine, the output depends on both the current state and the input, allowing immediate detection (in the same cycle as the final input bit).

 Key Features

Detects the sequence 1001 using a Mealy FSM

Supports overlapping or non-overlapping detection

Detection is immediate (no extra clock delay, unlike Moore FSM)

FSM Description

The FSM progresses through the following recognition steps:

S0 → No match / initial state

S1 → Saw 1

S2 → Saw 10

S3 → Saw 100

When in S3 and the input bit is 1, the sequence 1001 has been detected, and the output (dout) is asserted.

🔄 Overlapping vs Non-Overlapping
✅ Overlapping Detection

After detecting 1001, the FSM transitions to S1 (because the trailing 1 may be the start of a new sequence).

Example:

Input: 1001001

Output: Two detection pulses (at the 4th and 7th bits).

 Non-Overlapping Detection

After detecting 1001, the FSM transitions to S0 (forces a fresh start for the next detection).

Example:

Input: 1001001

Output: Only one detection pulse (at the 4th bit).

⚖️ Mealy vs Moore FSM

Mealy FSM (this design): Detection occurs in the same cycle as the final 1 of 1001.

Moore FSM: Detection would occur one cycle later, since outputs depend only on state.

📂 Repo Structure
.
├── README.md
├── fsm.v          # RTL 
└── tb.v       # Testbench

waveform:
<img width="1447" height="447" alt="Screenshot 2025-08-26 183142" src="https://github.com/user-attachments/assets/abfab63b-2a0a-4cbb-9547-02ff7017f52c" />

