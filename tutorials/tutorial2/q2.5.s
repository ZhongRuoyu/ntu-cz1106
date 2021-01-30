        ; Template for Tutorial 2.5
Var_100 DCD 0x01234567
Var_104 DCD 0x89ABCDEF
        ; Start of PC-relative code
Addr_00 MOV R0, #0          ; Clear R0
Addr_04 ADD PC, PC, #0x0    ; M1 - Relative jump to label Addr_0C
Addr_08 MOV R1, R0          ; Dummy instruction
Addr_0C ADD R1, PC, #0xEC   ; M2 - Get start address Var_100 into R1 in a PC-relative manner
Addr_10 LDR R0, [R1, #0x4]  ; M3 - Move the content at mem var Var_104 into R0
Addr_14 ADD R2, PC, #-0x4   ; M4 - Get start address of next instruction into R2
Addr_18 MOV PC, R2          ; M5 - Create an infinite loop with this instruction
        END
