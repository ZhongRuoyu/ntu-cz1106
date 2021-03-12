Num1    DCD 0x20
Num2    DCD 0x14
Result  DCD 0
        ADR SP, 0xFFFFFFFC
        ; Calling Program
        ADR R0, Num1
        ADR R1, Num2
        ADR R2, Result      ; setup registers with values
        ADR SP, 0xFFFFFFFC  ; (a) initialize Stack Pointer (SP) to top of memory
        LDR R0, [R0]        ; (b) move value of Num1 stored at 0x100 into R0
        LDR R1, [R1]        ; (c) move value of Num2 stored at 0x104 into R
        BL Mean             ; (d) call subroutine Mean
        STR R1, [R2]        ; move result of mean to memory var at 0x108
        END                 ; Stop emulation

        ; Subroutine Mean
Mean    ADD R1, R0, R1      ; add the two parameters in R0 and R1
        ASR R1, R1, #1      ; divide-by-2 using arithmetic shift right by 1 bit
        MOV PC, LR          ; return to calling program
