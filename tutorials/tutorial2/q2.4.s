Mem_100 DCD 0
Mem_104 DCD 1
Mem_10C DCD 2
Mem_110 DCD 3
Mem_114 DCD 4
Mem_11C DCD 5
Mem_120 DCD 6
Mem_124 DCD 7
        ; --------------------------------------------
        ; Average of 8 unsigned numbers
        ; Result based on constants above should be:
        ; R0 = 3 (Quotient) and
        ; R1 = 4 (Remainder)
        ; ------------------------------------------
Start   MOV R1, #0x100          ; initialize array pointer
        ; enter your code here
        MOV R2, #0              ; initialise quotient value
        MOV R3, #0              ; initialise remainder value
        MOV R5, #8              ; initialise count value
Loop    SUBS R5, R5, #1         ; decrement count value
        BMI Finish              ; jump to Finish if count value becomes negative
        LDR R6, [R1], #4        ; load next value and increment pointer
        ADD R2, R2, R6, ASR #3  ; add value / 8 to quotient
        AND R4, R6, #0x7        ; load current remainder
        ADD R3, R3, R4          ; add current remainder
        B Loop
Finish  ADD R2, R2, R3, ASR #3  ; add remainder / 8 to quotient
        AND R3, R3, #0x7        ; remainder becomes remainder modulo 8
        STR R2, [R1], #4        ; store quotient into memory and increment pointer
        STR R3, [R1]            ; store remainder into memory
        END
        ; Remark: Also works with signed values. No overflow with 32-bit numbers.
