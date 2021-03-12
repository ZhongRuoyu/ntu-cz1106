Num1    DCD 0x20
Num2    DCD 0x14
Result  DCD 0
        ADR SP, 0xFFFFFFFC
        ; Calling Program
        ADR SP, 0xFFFFFFFC  ; initialize Stack Pointer (SP) to top of memory
        MOV R0, #0x100      ;
        LDR R2, [R0], #4
        LDR R1, [R0], #4
        STMFD SP!, {R0-R2}  ; push address at memory variables Num1, Num2, Result to stack
        BL Mean             ; call subroutine Mean
        ADD SP, SP, #12     ; (h) remove the 3 parameters push to the stack earlier
        END                 ; Stop emulation

        ; Subroutine Mean
Mean    LDR R0, [SP, #8]    ; (d) move value of Num1 that is on the stack into R0
        LDR R1, [SP, #4]    ; (e) move value of Num2 that is on the stack to R1
        ADD R0, R0, R1      ; Add R1 to R0
        ASR R0, R0, #1      ; divide-by-2 using arithmetic shift right by 1 bit
        LDR R1, [SP]        ; (f) move address of Result that is on the stack into R2
        STR R0, [R1]        ; (g) move result in R0 into memory variable Result
        MOV PC, LR          ; return to calling program
