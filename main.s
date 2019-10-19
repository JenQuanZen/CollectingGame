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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Press Enter to start\000"
	.align	2
.LC2:
	.ascii	"collecting bones\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L4+16
	ldr	r2, .L4+20
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r4, [r3, #244]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	ldr	r5, .L4+24
	mov	r3, #252
	mov	r1, #70
	mov	r0, #90
	ldr	r2, .L4+28
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+32
	mov	r1, #80
	mov	r0, #100
	mov	r3, #252
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+44
	ldr	r3, .L4+48
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	StartPal
	.word	DMANow
	.word	StartBitmap
	.word	drawFullscreenImage4
	.word	83886336
	.word	15855
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #2
	ldr	ip, .L11
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+4
	ldr	r4, .L11+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L11+12
	strh	r2, [r3, #244]	@ movhi
	ldr	r2, .L11+16
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	dogPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L20
	ldr	r3, [r4]
	ldr	r2, .L20+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, [r4]
	ldr	r3, .L20+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L21:
	.align	2
.L20:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initializeGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Take your time\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L24
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L24+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L24+8
	ldr	r3, .L24+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+16
	ldr	r2, .L24+20
	mov	r1, #40
	mov	r0, #80
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L24+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	pausePal
	.word	DMANow
	.word	pauseBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
.L26:
	pop	{r4, lr}
	bx	lr
.L32:
	pop	{r4, lr}
	b	goToGame
.L34:
	.align	2
.L33:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Congrats! You won!\000"
	.align	2
.LC5:
	.ascii	"Press Enter to play again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	ldr	r4, .L37+4
	mov	r3, #250
	mov	r1, #60
	mov	r0, #80
	ldr	r2, .L37+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L37+12
	mov	r1, #80
	mov	r0, #60
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L37+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	fillScreen4
	.word	drawString4
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Bones Remaining: %d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L48
	ldr	r4, .L48+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L48+12
	ldr	r3, .L48+16
	ldr	r0, .L48+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L48+24
	mov	r1, #150
	mov	r0, #1
	ldr	r2, .L48+20
	mov	r3, #254
	mov	lr, pc
	bx	r5
	ldr	r3, .L48+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r3, .L48+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
.L40:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L47
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	pop	{r4, r5, r6, lr}
	b	goToWin
.L46:
	bl	goToPause
	b	.L40
.L49:
	.align	2
.L48:
	.word	updateGame
	.word	bonesRemaining
	.word	drawGame
	.word	.LC6
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L57+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L50:
	pop	{r4, lr}
	bx	lr
.L56:
	pop	{r4, lr}
	b	goToStart
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L70
	push	{r4, r7, fp, lr}
	ldr	r3, .L70+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L70+8
	ldr	fp, .L70+12
	ldr	r5, .L70+16
	ldr	r10, .L70+20
	ldr	r9, .L70+24
	ldr	r8, .L70+28
	ldr	r7, .L70+32
	ldr	r4, .L70+36
.L60:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L61:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L61
.L63:
	.word	.L66
	.word	.L65
	.word	.L64
	.word	.L62
.L62:
	mov	lr, pc
	bx	r7
	b	.L60
.L64:
	mov	lr, pc
	bx	r8
	b	.L60
.L65:
	mov	lr, pc
	bx	r9
	b	.L60
.L66:
	mov	lr, pc
	bx	r10
	b	.L60
.L71:
	.align	2
.L70:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	pause
	.word	game
	.word	win
	.word	67109120
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
