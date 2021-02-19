        ; ---------------------------------------------------------
        ; Expt_1c - Application #1 - Array of incrementing numbers
        ; ---------------------------------------------------------
            ; Allocate values in data memory
DataArea    EQU 0x00000100  ; data area starts at 0x0100
ASize       EQU 4           ; array size
FirstN      DCD 3           ; value of the first number in array
Step        DCD 2           ; increment steps
Num         FILL ASize      ; allocate memory for 4 integers
        ; Start of program
Start   MOV R3, #DataArea   ; initialize pointer R3 to start of data area
        MOV R2, #ASize      ; initialize array size into counter R2
        LDR R0, [R3], #4    ; load memory constant FirstN into R0
        LDR R1, [R3], #4    ; load memory constant Step into R1
Loop    STR R0, [R3], #4    ; store R0 into current array element
        ADD R0, R0, R1      ; increment R0 by Step
        SUBS R2, R2, #1     ; decrement counter R2 by 1
        BNE Loop            ; loop back if R2 is still not zero
        END
