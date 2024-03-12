format binary

section '.text' code readable executable
entry $

; Constants
LPT_PORT equ 0x378     ; Port address for LPT1

; Start of the program
start:
    mov dx, LPT_PORT    ; Load the port address into DX

toggle_loop:
    in al, dx           ; Read from the data register

    ; Toggle bits 0-7
    xor al, 0xFF        ; Toggle all bits

    out dx, al          ; Write back to the data register

    ; Delay (if needed)
    ; Adjust delay according to your requirement
    call delay

    jmp toggle_loop     ; Repeat indefinitely

; Delay subroutine (adjust as needed)
delay:
    ; This is a simple delay loop, adjust as needed
    mov cx, 10000       ; Loop count for delay
delay_loop:
    dec cx
    jnz delay_loop
    ret

; End of the program
