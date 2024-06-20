        .section .text
        .global mk1cal
        .type   mk1cal, %function
mk1cal:
        push    {r3-r11, lr}
        mov     r3, r2  @canvas
        mov     r4, r0  @y
        mov     r5, r1  @m
        mov     r6, #0  @dlen
        mov     r7, #0  @woff
        mov     r8, #0  @r
        mov     r9, #0  @d
        mov     r10, #0 @c
        mov     r11, #0 @b

        bl      monthlen
        mov     r6, r0

        mov     r0, r4
        mov     r1, r5
        mov     r2, #1
        bl      monthwoffset
        mov     r7, r0

        mov     r9, #1

mk1_loop:
        cmp     r9, r6
        bgt     mk1_loopout
        mov     r10, r7
        add     r10, r10, r9
        sub     r10, r10, #1
        add     r10, r10, #7
        mov     r0, r10
        mov     r1, #7
        bl      modsub
        mov     r10, r0

        mov     r11, r8
        mov     r0, #21
        mul     r11, r11, r0
        mov     r0, #3
        mul     r1, r10, r0
        add     r11, r11, r1    @kuuhaku+1

        cmp     r9, #10
        blt     loop2

        mov     r0, r9
        mov     r1, #10
        bl      divsub
        add     r1, r0, #48
        strb    r1, [r3, r11]

loop2:
        add     r11, r11, #1    @kuuhaku+1
        mov     r0, r9
        mov     r1, #10
        bl      modsub          @r0 = d%10
        add     r1, r0, #48     @r1 = d%10 + '0'
        strb    r1, [r3, r11]   @canvas[b] = r1

        cmp     r10, #6
        addge   r8, r8, #1
        add r9, r9, #1
        b mk1_loop
mk1_loopout:
        pop     {r3-r11, lr}
        bx      lr
