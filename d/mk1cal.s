.section .text
.global mk1cal
.type mk1cal, %function

mk1cal:
    push {r4-r12, lr}@レジスタ12まで使用可能
    mov r4, r0
    mov r5, r1
    mov r6, r2

    mov r2, #0
loop:
    cmp r2, r3
    bge loopout

    cmp r5, #13
    addge r4, r4, #1
    subge r5, r5, #12

    push {r2}
    mov r0, r4
    mov r1, r5
    mov r2, #1
    bl monthwoffset
    mov r7, r0
    pop {r2}

    mov r0, r4
    mov r1, r5
    bl monthlen
    mov r8, r0

    mov r9, #1

    mov r0, #6
    mul r12, r2, r0
loop1:
    cmp r9, r8
    addgt r5, r5, #1
    addgt r2, r2, #1
    bgt loop

    add r10, r7, r9
    sub r10, r10, #1
    add r10, r10, #7
    mov r0, r10
    mov r1, #7
    bl modsub
    mov r10, r0

    mov r0, #21
    mul r11, r12, r0
    mov r0, #3
    mul r0, r10, r0
    add r11, r11, r0

    cmp r9, #10
    blt loop2

    mov r0, r9
    mov r1, #10
    bl divsub
    add r0, r0, #48
    strb r0, [r6, r11]

loop2:
    add r11, r11, #1

    mov r0, r9
    mov r1, #10
    bl modsub
    add r0, r0, #48
    strb r0, [r6, r11]

    cmp r10, #6
    addge r12, r12, #1
    add r9, r9, #1
    b loop1
loopout:
    pop {r4-r12, lr}
    bx lr
