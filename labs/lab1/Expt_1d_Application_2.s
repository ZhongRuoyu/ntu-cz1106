        ; ---------------------------------------------------------
        ; Expt_1d Application #2 - String Length Counting
        ; 1. Count the length of the string starting at label String_A
        ; 2. Memory variable Count_A contains the length after execution
        ; Speed: 82 cycles
        ; ---------------------------------------------------------
            ; Allocate variables and constants into data memory
DataArea    EQU 0x00000100  ; data area starts at 0x0100
Null_char   EQU 0           ; declare value of null character
Count_A     FILL 4          ; create int memory variable for String length
String_A    DCD 0x6C6C6548  ; place the string "Hello World!"
Str_A1      DCD 0x6F57206F  ; into memory using their
Str_A2      DCD 0x21646C72  ; individual ASCII characters
Str_A3      DCD 0xFFFFFF00  ; putting 0xFF after the string
        ; Start of program
Start   MOV R1, #Count_A    ; initialise pointer R1 to mem var Count_A
        ADD R2, R1, #4      ; initialise pointer R2 to start of String_A
        ADD R0, R1, #5      ; initialise pointer R0 to past-the-start of String_A
Loop    LDRB R3, [R2], #1   ; get current element in string from memory and increment pointer to next string element
        CMP R3, #Null_char  ; compare with Null value
        BNE Loop            ; loop back to loop if not Null character
Done    SUB R0, R2, R0      ; save length to R0
        STR R0, [R1]        ; save length to mem var Count_A
        END
