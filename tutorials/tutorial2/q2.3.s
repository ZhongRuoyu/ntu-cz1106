Mem_100 DCD 0x3224FFFF      ; pre-loads memory values into their respective memory locations
Mem_104 DCD 0x22282317
Mem_108 DCD 0x17208013
Mem_10C DCD 0x2D142580
Start       MOV R1, #0x100  ; points to initial address location
            MOV R4, #0x100  ; points to HotDays
            MOV R0, #0      ; initialises day counter
            STRB R0, [R4]   ; stores initialised day counter value into HotDays
            ADD R1, R1, #2  ; points to first data
Loop        LDRB R3, [R1]   ; loads data into register
            CMP R3, #0x80   ; compares number loaded with -128
            BEQ Done        ; if -128 is loaded, jumps to Done and finishes the loop
            ADD R0, R0, #1  ; increments day counter
            LDRB R3, [R1]   ; loads data into register
            CMP R3, #36     ; compares number loaded with 36
            BHS HotFound    ; if unsigned number loaded is not smaller than 36, jumps to HotFound
            ADD R1, R1, #1  ; points to next data
            B Loop          ; jumps to Loop and starts next loop cycle
HotFound    LDRB R2, [R4]   ; loads current value of HotDays
            ADD R2, R2, #1  ; increments value loaded
            STRB R2, [R4]   ; stores new value into HotDays
            ADD R1, R1, #1  ; points to next data
            B Loop          ; jumps to Loop and starts next loop cycle
Done        ADD R4, R4, #1  ; points to DaySum
            STRB R0, [R4]   ; stores day counter value
            END
