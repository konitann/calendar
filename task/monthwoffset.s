        .section .text
        .align  2
        .global monthwoffset
        .type   monthwoffset,   %function
monthwoffset:
        push    {r4-r8, lr}
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2

        cmp     r5, #3
        sublt   r4, r4, #1
        addlt   r5, r5, #12

        mov     r7, #0

        mov     r7, r4

        mov     r0, r4
        mov     r1, #4
        bl      divsub
        add     r7, r7, r0

        mov     r0, r4
        mov     r1, #100
        bl      divsub
        sub     r7, r7, r0

        mov     r0, r4
        mov     r1, #400
        bl      divsub
        add     r7, r7, r0

        mov     r0, #13
        mul     r0, r0, r5
        add     r0, r0, #8
        mov     r1, #5
        bl      divsub
        add     r7, r7, r0

        add     r7, r7, r6

        mov     r0, r7
        mov     r1, #7
        bl      modsub

        pop     {r4-r8, lr}
        bx      lr
