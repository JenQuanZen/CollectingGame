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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L19
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L12:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L12
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, r0
	sub	sp, sp, #12
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	ldrb	r0, [sp, #48]	@ zero_extendqisi2
	ands	r8, lr, #1
	orr	ip, ip, r0, lsl #8
	strh	ip, [sp, #6]	@ movhi
	and	r5, r2, #1
	beq	.L44
	cmp	r5, #0
	beq	.L45
	cmp	r3, #0
	ble	.L21
	mov	r5, #0
	ldr	ip, .L46
	add	r3, r1, r3
	sub	r7, r2, #1
	asr	r7, r7, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r0, r1, r1, lsl #4
	ldm	ip, {r4, r6}
	add	r0, lr, r0, lsl #4
	add	ip, lr, r3, lsl #4
	orr	lr, r7, #-2130706432
	add	r7, sp, #6
.L34:
	add	r1, r0, r0, lsr #31
	cmp	r2, #1
	bic	r1, r1, #1
	ble	.L33
	add	r3, r0, #1
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r3, r4, r3
	str	r5, [r6, #44]
	str	r7, [r6, #36]
	str	r3, [r6, #40]
	str	lr, [r6, #44]
.L33:
	ldrb	r3, [r4, r1]	@ zero_extendqisi2
	ldrb	r8, [sp, #48]	@ zero_extendqisi2
	add	r0, r0, #240
	orr	r3, r3, r8, lsl #8
	cmp	ip, r0
	strh	r3, [r4, r1]	@ movhi
	bne	.L34
.L21:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L44:
	cmp	r5, #0
	beq	.L23
	cmp	r3, #0
	ble	.L21
	add	r3, r1, r3
	ldr	r5, .L46
	add	r9, lr, r2
	rsb	r3, r3, r3, lsl #4
	sub	r7, r2, #1
	add	ip, r9, r3, lsl #4
	sub	r6, r9, #1
	rsb	r1, r1, r1, lsl #4
	add	lr, lr, #1
	asr	r7, r7, #1
	ldm	r5, {r4, r5}
	sub	lr, lr, r9
	add	r3, r6, r1, lsl #4
	sub	r0, ip, #1
	and	r6, r6, #1
	orr	r7, r7, #-2130706432
	add	r9, sp, #6
.L30:
	add	r1, r3, r3, lsr #31
	cmp	r2, #1
	bic	r1, r1, #1
	ble	.L27
	add	ip, lr, r3
	add	ip, ip, ip, lsr #31
	bic	ip, ip, #1
	add	ip, r4, ip
	str	r8, [r5, #44]
	str	r9, [r5, #36]
	str	ip, [r5, #40]
	str	r7, [r5, #44]
.L27:
	ldrh	r10, [r4, r1]
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	cmp	r6, #0
	and	ip, ip, #255
	and	fp, r10, #255
	add	r3, r3, #240
	andeq	r10, r10, #65280
	orrne	ip, fp, ip, lsl #8
	orreq	ip, r10, ip
	cmp	r0, r3
	strh	ip, [r4, r1]	@ movhi
	bne	.L30
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	cmp	r3, #0
	ble	.L21
	ldr	r0, .L46
	add	r3, r1, r3
	add	r2, r2, r2, lsr #31
	rsb	r1, r1, r1, lsl #4
	asr	r2, r2, #1
	rsb	r3, r3, r3, lsl #4
	ldm	r0, {r6, ip}
	orr	r2, r2, #-2130706432
	add	r0, lr, r1, lsl #4
	add	r4, lr, r3, lsl #4
	add	r1, sp, #6
.L26:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r4, r0
	str	r5, [ip, #44]
	str	r1, [ip, #36]
	str	r3, [ip, #40]
	str	r2, [ip, #44]
	bne	.L26
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	cmp	r3, #0
	ble	.L21
	ldr	ip, .L46
	add	r3, r1, r3
	sub	r7, r2, #2
	rsb	r0, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	add	r1, lr, r2
	asr	r8, r7, #1
	ldm	ip, {r4, r6}
	add	r0, lr, r0, lsl #4
	add	ip, lr, r3, lsl #4
	orr	r8, r8, #-2130706432
	and	lr, r1, #1
	add	r9, sp, #6
.L38:
	add	r3, r7, r0
	add	r1, r0, r0, lsr #31
	add	r3, r3, r3, lsr #31
	cmp	r2, #2
	bic	r1, r1, #1
	bic	r3, r3, #1
	ble	.L35
	add	r10, r0, #1
	add	r10, r10, r10, lsr #31
	bic	r10, r10, #1
	add	r10, r4, r10
	str	r5, [r6, #44]
	str	r9, [r6, #36]
	str	r10, [r6, #40]
	str	r8, [r6, #44]
.L35:
	ldrb	r10, [r4, r1]	@ zero_extendqisi2
	ldrb	fp, [sp, #48]	@ zero_extendqisi2
	orr	r10, r10, fp, lsl #8
	strh	r10, [r4, r1]	@ movhi
	ldrb	r1, [sp, #48]	@ zero_extendqisi2
	ldrh	r10, [r4, r3]
	cmp	lr, #0
	and	r1, r1, #255
	and	fp, r10, #255
	add	r0, r0, #240
	andeq	r10, r10, #65280
	orrne	r1, fp, r1, lsl #8
	orreq	r1, r10, r1
	cmp	r0, ip
	strh	r1, [r4, r3]	@ movhi
	bne	.L38
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L50
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L50+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L54
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L54+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L56
	mov	r4, #0
	ldr	r6, .L62
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L58:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L58
.L56:
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L72
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L66:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L66
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L75
	ldr	r1, .L75+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L78
	ldr	r1, .L78+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L79:
	.align	2
.L78:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L81:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L81
	mov	r2, #67108864
.L82:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L82
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L89
	moveq	r2, #100663296
	ldr	r0, .L89+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L90:
	.align	2
.L89:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L93
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L94:
	.align	2
.L93:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L99
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L101
.L99:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L101:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L99
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
