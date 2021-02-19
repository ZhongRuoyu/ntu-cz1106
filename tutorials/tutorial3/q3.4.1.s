N1  DCD 0x3
M1  DCD 0xFFFFFFFF, 0x111
M2  DCD 0x2, 0x600
M3  DCD 0x222, 0x100

START   MOV SP, #0xFFFFFFFC
        MOV R0, #N1         ; (m1) push the value in N1
        LDR R1, [R0], #4    ; (m2) and M1
                            ; (m3)
        STMFD SP!, {R0, R1} ; (m4) on to the stack
        BL SubA             ; (m5) make a call to subroutine SubA
        END

SubA    STMFD SP!, {R4-R7}  ; (s1) save value registers R4-R7 on to the stack
        SUB SP, SP, #12     ; (s2) create a 3-word stack frame on the stack
        LDR R4, [SP, #32]   ; (s3) get the contents of N1 on the stack into R4
        STR R4, [SP]        ; (s4) use 1st word (SF1) in stack frame to save value of N
        LDR R4, [SP, #28]   ; (s5) get the address of M1 on the stack into R4
        MOV R5, #0          ; (s6) clear 2nd word (SF2) in stack frame
        STR R5, [SP, #4]
        MOV R6, #0          ; (s7) clear 3rd word (SF3) in stack frame
        STR R6, [SP, #8]
Loop    LDR R7, [R4]        ; (s8) add lower word of integer and save result in (SF2)
        ADDS R5, R5, R7
        STR R5, [SP, #4]
        LDR R7, [R4, #4]    ; (s9) add upper word of integer and save result in (SF3)
        ADC R6, R6, R7
        STR R6, [SP, #8]
        LDR R7, [SP]        ; (s10) decrement value of N1 in (SF1)
        SUBS R7, R7, #1
        STR R7, [SP]
        BEQ Done            ; (s11) jump if N1 = 0
        ADD R4, R4, #8      ; (s12) point to next integer
        B Loop              ; (s13) jump back to add again
Done    LDR R5, [SP, #4]    ; (s14) copy result to
        LDR R6, [SP, #8]    ; (s15)
        STR R5, [R4]        ; (s16)
        STR R6, [R4, #4]    ; (s17) last array item
        ADD SP, SP, #12     ; (s18) collapse stack frame
        LDMFD SP!, {R4-R7}  ; (s19) restore original registers
        MOV PC, LR
