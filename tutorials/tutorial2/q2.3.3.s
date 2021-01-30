Mem_100 DCD 0x3224FFFF      ; pre-loads memory values into their respective memory locations
Mem_104 DCD 0x22282317
Mem_108 DCD 0x17208013
Mem_10C DCD 0x2D142580
Start   MOV R0, #0          ; initialises day counter
        MOV R2, #0          ; initialises hot day counter
        MOV R4, #0x100      ; points to HotDays
        ADD R1, R4, #2      ; points to first data
Loop    LDRB R3, [R1], #1   ; loads data into register and increments pointer
        CMP R3, #0x80       ; compares number loaded with -128
        BEQ Done            ; if -128 is loaded, jumps to Done and finishes the loop
        CMP R3, #36         ; compares number loaded with 36
        ADDHS R2, R2, #1    ; increments hot day counter if unsigned number loaded is not smaller than 36
        ADD R0, R0, #1      ; increments day counter
        B Loop              ; jumps to Loop and starts next loop cycle
Done    STRB R2, [R4], #1   ; stores new value into HotDays and makes pointer point to DaySum
        STRB R0, [R4]       ; stores day counter value
        END
