NUMX    DCD 0x4
NUMY    DCD 0x3
ANS     FILL 4
Start   MOV SP, #0xFFFFFFFC ; (a1) Initialise stack pointer
        MOV R0, #0x100
        LDR R1, [R0]
        STR R1, [SP, #-4]!  ; (b1) NumX to stack
        ADD R0, R0, #4
        LDR R1, [R0]
        STR R1, [SP, #-4]!  ; (b2) NumY to stack
        ADD R0, R0, #4
        STR R0, [SP, #-4]!  ; (b3) Ans to stack
        BL MySub            ; (c1)
        LDR R0, [SP, #-4]   ; (d1)
        ADD SP, SP, #12     ; (e1) Remove stack parameters
        END
MySub   STMFD SP!, {R0-R3}  ; (s1) Save registers R0, R1, R2, R3
        LDR R1, [SP, #24]   ; (s2) Retrieve NumX from stack
        LDR R2, [SP, #20]   ; (s3) Retrieve NumY from stack
        MOV R0, #0          ; Complete the segment of code to compute the
Loop    CMP R2, #0          ; value of NumX * NumY using successive addition
        ADDNE R0, R0, R1
        SUBNE R2, R2, #1
        BNE Loop
        LDR R3, [SP, #16]   ; (s4a) Move the result directly to...
        STR R0, [R3]        ; (s4b) ... the memory variable Ans
        LDMFD SP!, {R0-R3}  ; (s5) Restore saved registers
        MOV PC, LR          ; (s6) Return to calling program
