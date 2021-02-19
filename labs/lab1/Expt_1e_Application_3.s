        ; --------------------------------------------------------------
        ; Expt_1e Application #3 - Sorting into ascending order
        ; 1. Sort the 7 integers in array N-Array in ascending order
        ; 2. The smallest value starts are N_Array after execution
        ; -------------------------------------------------------------
            ; Allocate variables and constants into data memory
DataArea    EQU 0x00000100      ; data area starts at 0x0100
N_Size      EQU 7               ; declare size of N-Array
N_Array     DCD 0x00000010      ; start of N-array, decimal (16)
N_2         DCD 0x00000003      ; decimal (3)
N_3         DCD 0xFFFFFFFF      ; decimal (-1)
N_4         DCD 0x00000003      ; decimal (3)
N_5         DCD 0xFFFFFFFD      ; decimal (-3)
N_6         DCD 0x00000020      ; decimal (32)
N_7         DCD 0xFFFFFFEE      ; decimal (-18)
        ; Start of program
        ; An implementation of the gnome sort
        ; https://en.wikipedia.org/wiki/Gnome_sort
Start   MOV R0, #N_Size     ; R0 = N_Size
        MOV R1, #DataArea   ; R1 = DataArea
        MOV R2, #0          ; R2 = 0  // stores offset in bytes
Loop    CMP R0, R2, ASR #2  ; if (N_Size <= (R2 >> 2)):
        BLE Done            ;   goto Done
        CMP R2, #0          ; if (R2 > 0):
        SUBGT R2, R2, #4    ;   R2 = R2 - 4
        ADDGT R5, R1, R2    ;   R5 = R1 + R2  // address of a[(R2 >> 2)]
        LDRGT R3, [R5, #4]  ;   R3 = [R5 + 4]
        LDRGT R4, [R5]      ;   R4 = [R5]
        CMPGT R4, R3        ;   continue if (R4 <= R3)
        STRGT R3, [R5]      ;   [R5] = R3
        STRGT R4, [R5, #4]  ;   [R5 + 4] = R4 // values swapped
        ADDLE R2, R2, #8    ; else: R2 = R2 + 8
        B Loop              ; goto Loop
Done    END
