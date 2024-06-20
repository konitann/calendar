    .section .text
    .global week
    .type week, %function
week:
        push {r1-r11,lr}
        ldr r1, =msg
        mov r2, #0
loop:
        ldrb r0, [r1,r2]
        cmp  r0, #0
        beq  loopend
        add  r2, r2, #1
        b    loop
loopend:
        mov r0,#1
        mov r7,#4
        svc #0

        mov r0,#0
        mov r7,#1

        pop {r1-r11,lr}
        bx  lr

.section .data
msg:
        .ascii "Su Mo Tu We Th Fr Sa\n\0"
        