.section .text
        .global pch
        .type   pch,%function
        @char_output
pch:
        push {r1,r2, r7,lr}

        ldr r1, =pchbuf
        strb r0, [r1, #0]

        mov r0,#1
        ldr r1, = pchbuf
        mov r2, #1
        mov r7, #4
        svc #0

        pop {r1,r2,r7,lr}
        mov r0,#0
        bx lr

        .section .data
pchbuf:
        .asciz "XYZ"
        