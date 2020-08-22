# SAP 1 Computer
Model of a microprocessor


The SAP computer (Simple-As-Possible) was designed with the objective of presenting in a playful way the operational structure of a modern electronic computer, so that it becomes simpler to abstract the design used in computers most modern electronics. 

# Project specification
The SAP architecture consists of 10 modules and one bus:

• PC (program counter) with inputs Cp, clock, reset, Ep;

• Input and REM (Memory Address Register) with inputs LM, clock;

• RAM (Random Access Memory) with CE input and the address that comes from REM;

• RI (Instruction register) with LI, clock, reset, EI inputs;

• Accumulator with LA, clock and reset inputs;

• Adder / Subtractor with SU and EU inputs;

• Register B that has LB and clock inputs;

• Output recorder with Lo and clock inputs;

• Controller, which has as inputs clock, reset and the instruction that comes from the IR.
