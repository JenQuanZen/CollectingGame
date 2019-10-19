	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initializeDog
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeDog, %function
initializeDog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #20
	mov	r1, #130
	mov	r2, #220
	ldr	r3, .L3
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	bx	lr
.L4:
	.align	2
.L3:
	.word	dog
	.size	initializeDog, .-initializeDog
	.align	2
	.global	updateDog
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDog, %function
updateDog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L6
	ldr	r2, .L10+4
	ldr	r1, [r2, #4]
	ldr	r3, [r2, #20]
	add	r3, r1, r3
	cmp	r3, #239
	addle	r1, r1, #1
	strle	r1, [r2, #4]
.L6:
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L7
	ldr	r2, .L10+4
	ldr	r3, [r2, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
.L7:
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L8
	ldr	r2, .L10+4
	ldr	r1, [r2]
	ldr	r3, [r2, #16]
	add	r3, r1, r3
	cmp	r3, #159
	addle	r1, r1, #1
	strle	r1, [r2]
.L8:
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bxne	lr
	ldr	r2, .L10+4
	ldr	r3, [r2]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r2]
	bx	lr
.L11:
	.align	2
.L10:
	.word	67109120
	.word	dog
	.size	updateDog, .-updateDog
	.align	2
	.global	drawDog
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDog, %function
drawDog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #250
	push	{r4, r5, lr}
	ldr	r4, .L14
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L14+4
	mov	lr, pc
	bx	r5
	ldr	ip, .L14+8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	ip, [sp]
	ldr	r5, .L14+12
	mov	lr, pc
	bx	r5
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	dog
	.word	drawRect4
	.word	dogBitmap
	.word	drawImage4
	.size	drawDog, .-drawDog
	.align	2
	.global	initializeBone
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBone, %function
initializeBone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #5
	ldr	r4, .L20
	ldr	r5, .L20+4
	ldr	r8, .L20+8
	ldr	r7, .L20+12
	add	r6, r4, #440
.L17:
	mvn	r3, #1
	mov	r2, #15
	strb	r3, [r4, #32]
	str	r2, [r4, #28]
	str	r9, [r4, #24]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	r2, #0
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
	add	r0, r0, r1
	str	r2, [r4, #40]
	str	r1, [r4, #36]
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	sub	r0, r0, #2
	str	r0, [r4, #16]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	ldr	r2, [r4, #4]
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	ldr	r3, [r4]
	sub	r0, r0, #2
	str	r0, [r4, #20]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L17
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	bones
	.word	rand
	.word	458129845
	.word	1374389535
	.size	initializeBone, .-initializeBone
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #20
	mov	r1, #130
	mov	r2, #220
	ldr	r3, .L24
	push	{r4, lr}
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	bl	initializeBone
	mov	lr, #10
	ldr	ip, .L24+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+8
	ldr	r4, .L24+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L24+16
	strh	r2, [r3, #244]	@ movhi
	ldr	r2, .L24+20
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	dog
	.word	bonesRemaining
	.word	dogPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initializeGame, .-initializeGame
	.align	2
	.global	updateBone
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBone, %function
updateBone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	ldm	r0, {r2, r3}
	ldr	r1, [r0, #28]
	sub	sp, sp, #20
	bne	.L40
.L27:
	cmp	r2, #0
	ldr	r0, [r4, #16]
	ble	.L29
	ldr	ip, [r4, #24]
	add	ip, r2, ip
	cmp	ip, #159
	ble	.L30
.L29:
	rsb	r0, r0, #0
	str	r0, [r4, #16]
.L30:
	cmp	r3, #0
	movgt	ip, #0
	movle	ip, #1
	add	r1, r3, r1
	cmp	r1, #238
	movle	r1, ip
	orrgt	r1, ip, #1
	cmp	r1, #0
	ldr	r1, [r4, #20]
	rsbne	r1, r1, #0
	add	r2, r2, r0
	add	r3, r3, r1
	stm	r4, {r2, r3}
	strne	r1, [r4, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L40:
	ldr	ip, [r4, #24]
	ldr	r0, .L41
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L41+4
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r1, #0
	ldrne	r2, .L41+8
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	strne	r1, [r4, #36]
	ldm	r4, {r2, r3}
	ldr	r1, [r4, #28]
	b	.L27
.L42:
	.align	2
.L41:
	.word	dog
	.word	collision
	.word	bonesRemaining
	.size	updateBone, .-updateBone
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updateDog
	ldr	r4, .L47
	add	r5, r4, #440
.L44:
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBone
	cmp	r4, r5
	bne	.L44
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	bones
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBone
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBone, %function
drawBone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	ldr	r0, [r0, #4]
	ldr	r1, [r4]
	sub	sp, sp, #12
	bne	.L53
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L54
.L51:
	str	r0, [r4, #12]
	str	r1, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L54:
	mov	r3, #250
	str	r3, [sp]
	ldr	r5, .L55
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r0, [r4, #4]
	str	r3, [r4, #40]
	ldr	r1, [r4]
	b	.L51
.L53:
	mov	r3, #254
	str	r3, [sp]
	ldr	r5, .L55
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	b	.L51
.L56:
	.align	2
.L55:
	.word	drawRect4
	.size	drawBone, .-drawBone
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #250
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	bl	drawDog
	ldr	r4, .L61+4
	add	r5, r4, #440
.L58:
	mov	r0, r4
	add	r4, r4, #44
	bl	drawBone
	cmp	r4, r5
	bne	.L58
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	fillScreen4
	.word	bones
	.size	drawGame, .-drawGame
	.comm	bonesRemaining,4,4
	.comm	bones,440,4
	.comm	dog,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
