	.section .text
        .global divsub
        .type divsub, %function
@r0/r1
divsub:
	push {r2,lr}
	mov r2, #0
loop:
	cmp r0,r1
	blt loopout
	add r2,r2,#1
	sub r0,r0,r1
	b loop
loopout:
	mov r0,r2
	pop {r2,lr}
	bx  lr
