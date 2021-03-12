STR_C   DCD 0x12345678, 0xABBAABBA, 0xBABACDCD, 0xDEADBEEF, 0x01234567, 0xBADCAB00, 0x00000000
        ; Calling Program
        ADR SP, 0xFFFFFFFC  ; initialize Stack Pointer (SP) to top of memory
        ADR R0, STR_C       ; Fill R0 with start address
        STMFD SP!, {R0}     ; push start address of string to stack
        BL Strlen           ; call subroutine Mean
        ADD SP, SP, #4      ; perform appropriate housekeeping of the stack
        END                 ; Terminate

        ; Subroutine Strlen
Strlen  STMFD SP!, {R4-R6}  ; save registers used in Strlen subroutine to stack
        LDR R4, [SP, #12]
        MOV R5, R4
Loop    LDRB R6, [R5], #1
        CMP R6, #0
        BNE Loop
        SUB R0, R5, R4
        LDMFD SP!, {R4-R6}
        MOV PC, LR          ; complete the subroutine Strlen
