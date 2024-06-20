        .section .text
        .global monthlen
        .type   monthlen, %function
monthlen:
        push    {r4-r7, lr}
        mov     r4, r0
        mov     r5, r1
        mov     r6, #0

        mov     r0, r4
        mov     r1, #4
        bl      modsub
        cmp     r0, #0
        addeq   r6, r6, #1


        mov     r0, r4
        mov     r1, #100
        bl      modsub
        cmp     r0, #0
        subeq   r6, r6, #1

        mov     r0, r4
        mov     r1, #400
        bl      modsub
        cmp     r0, #0
        addeq   r6, r6, #1

        cmp     r5, #2
        beq     February_uru

        cmp     r5, #1
        beq     Thirtyone
        cmp     r5, #3
        beq     Thirtyone
        cmp     r5, #5
        beq     Thirtyone
        cmp     r5, #7
        beq     Thirtyone
        cmp     r5, #8
        beq     Thirtyone
        cmp     r5, #10
        beq     Thirtyone
        cmp     r5, #12
        beq     Thirtyone

        mov     r0, #30
        b       end_monthlen

February_uru:
        cmp     r6, #0
        beq     February
        mov     r0, #29
        b       end_monthlen

February:
        mov     r0, #28
        b       end_monthlen

Thirtyone:
        mov     r0, #31
        b       end_monthlen

end_monthlen:
        pop     {r4-r7, lr}
        bx      lr
