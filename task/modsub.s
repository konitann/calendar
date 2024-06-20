	.section .text
	.global modsub
	.type modsub, %function
modsub:
loop:
@Input r0,r1
@r1 == #7
	cmp r0, r1
	blt loopout
	sub r0, r0, r1
	b loop
loopout:
	bx lr
