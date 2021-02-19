        ; ----------------------------------------------------------
        ;   Expt_1a on Assembler directives, number representation
        ;   and setting N,Z,V,C status bits in the CPSR
        ; ----------------------------------------------------------
            ; Assembler directives
NumCount    EQU 8           ; EQUate symbol to constant value
Num1        DCD 0x12345678  ; Define 32-bit value in memory
Num2        DCD NumCount    ; Define value in mem using symbol
Num3        DCD 0x128       ; hexadecimal versus
Num4        DCD 128         ; decimal
Num5        DCD 0x0000ABCD  ; 32-bit value in hex
Num6        DCD 0xABCD      ; leading 0's not displayed
Num7        DCD 2           ; positive versus
Num8        DCD -2          ; negative (2's complement)
        ; Start of program
Start   MOV R0, #0              ; move 0 to R0 (CPSR unaffected)
        MOVS R1, #0             ; move 0 to R1, affect CPSR
        MOVS R2, #-1            ; move -1 to R2, affect CPSR
        MOV R3, #1              ; move 1 to R3 (CPSR unaffected)
        MOVS R4, #0x80000000    ; move 0x80000000 into R4
        ADDS R5, R2, R3         ; add 1 and -1
        ADDS R6, R4, R4         ; add 0x80000000 and 0x80000000
        END                     ; stop emulation
