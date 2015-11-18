    .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */


	#### while statement
MJ_L0:

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	# check condition, jump if false
	# load a boolean expression off stack
	pop		r24
	ldi		r25,0
	cp		r24, r25
	# WANT breq MJ_L2
	brne	MJ_L1
	jmp		MJ_L2

	# while loop body
MJ_L1:
	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 3
	ldi		r24,lo8(3)
	ldi		r25,hi8(3)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Load constant int 7
	ldi		r24,lo8(7)
	ldi		r25,hi8(7)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Cloud_rain

	# Load constant int 500
	ldi		r24,lo8(500)
	ldi		r25,hi8(500)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z8delay_msj

	# Load constant int 3
	ldi		r24,lo8(3)
	ldi		r25,hi8(3)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Load constant int 0
	ldi		r24,lo8(0)
	ldi		r25,hi8(0)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.DARK
	# load a one byte expression off stack
	ldi		r22,0
	# load a one byte expression off stack
	push	r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop		r20
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Load constant int 6
	ldi		r24,lo8(6)
	ldi		r25,hi8(6)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.ORANGE
	# load a one byte expression off stack
	ldi		r22,2
	# load a one byte expression off stack
	push	r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop		r20
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev

	# jump to while test
	jmp	MJ_L0

	# end of while
MJ_L2:



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

	/* prologue start for function Cloud_rain */
	.text
.global Cloud_rain
	.type Cloud_rain, @function
Cloud_rain:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
	push	r30
	push	r30
	push	r30

	# copy stack pointer to frame pointer
	in		r28, __SP_L__
	in		r29, __SP_H__

	# save off parameters
	std		Y+2,r25
	std		Y+1,r24
	std		Y+3,r22
	std		Y+4,r20
/* done with function Cloud_rain prologue */

	#### if statement

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Cloud_inBounds

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L4
	brne	MJ_L3
	jmp		MJ_L4

	# then label for if
MJ_L3:

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# Color expression Meggy.Color.BLUE
	# load a one byte expression off stack
	ldi		r22,5
	# load a one byte expression off stack
	push	r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop		r20
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev

	#### if statement

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L9
	ldi		r27, 0
	jmp	MJ_L10
MJ_L9:
	ldi		r27, hi8(-1)
MJ_L10:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L11
	ldi		r27, 0
	jmp	MJ_L12
MJ_L11:
	ldi		r27, hi8(-1)
MJ_L12:
	push	r27
	push	r26
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Cloud_inBounds

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L7
	brne	MJ_L6
	jmp		MJ_L7

	# then label for if
MJ_L6:

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L13
	ldi		r27, 0
	jmp	MJ_L14
MJ_L13:
	ldi		r27, hi8(-1)
MJ_L14:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L15
	ldi		r27, 0
	jmp	MJ_L16
MJ_L15:
	ldi		r27, hi8(-1)
MJ_L16:
	push	r27
	push	r26
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.DARK
	# load a one byte expression off stack
	ldi		r22,0
	# load a one byte expression off stack
	push	r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop		r20
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6DrawPxhhh
	call	_Z12DisplaySlatev

# skip else clause
	jmp	MJ_L8

	# else label for if
MJ_L7:

	# done label for if
MJ_L8:

	# Load constant int 100
	ldi		r24,lo8(100)
	ldi		r25,hi8(100)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z8delay_msj

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L17
	ldi		r27, 0
	jmp	MJ_L18
MJ_L17:
	ldi		r27, hi8(-1)
MJ_L18:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L19
	ldi		r27, 0
	jmp	MJ_L20
MJ_L19:
	ldi		r27, hi8(-1)
MJ_L20:
	push	r27
	push	r26
	# load an int off stack
	pop		r24
	pop		r25
	# Do subtraction operation
	sub		r24, r18
	sbc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Cloud_rain

# skip else clause
	jmp	MJ_L5

	# else label for if
MJ_L4:

	# done label for if
MJ_L5:

/* epilogue start for Cloud_rain */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Cloud_rain, .-Cloud_rain

	/* prologue start for function Cloud_inBounds */
	.text
.global Cloud_inBounds
	.type Cloud_inBounds, @function
Cloud_inBounds:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
	push	r30
	push	r30
	push	r30

	# copy stack pointer to frame pointer
	in		r28, __SP_L__
	in		r29, __SP_H__

	# save off parameters
	std		Y+2,r25
	std		Y+1,r24
	std		Y+3,r22
	std		Y+4,r20
/* done with function Cloud_inBounds prologue */

	### short-circuited && op
	# &&: eval left operand

	# Load constant int 0
	ldi		r24,lo8(0)
	ldi		r25,hi8(0)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# load an int off stack
	pop		r18
	pop		r19
	# load an int off stack
	pop		r24
	pop		r25
	# Do subtraction operation
	sub		r24, r18
	sbc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	## less-than check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L21
	ldi		r27, 0
	jmp	MJ_L22
MJ_L21:
	ldi		r27, hi8(-1)
MJ_L22:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L23
	ldi		r27, 0
	jmp	MJ_L24
MJ_L23:
	ldi		r27, hi8(-1)
MJ_L24:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L26
	# result is false
MJ_L25:
	ldi		r24, 0
	jmp		MJ_L27
	# result is true
MJ_L26:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L27:
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L28
	brne	MJ_L29
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L28

MJ_L29:
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# Load constant int 8
	ldi		r24,lo8(8)
	ldi		r25,hi8(8)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	## less-than check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L30
	ldi		r27, 0
	jmp	MJ_L31
MJ_L30:
	ldi		r27, hi8(-1)
MJ_L31:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L32
	ldi		r27, 0
	jmp	MJ_L33
MJ_L32:
	ldi		r27, hi8(-1)
MJ_L33:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L35
	# result is false
MJ_L34:
	ldi		r24, 0
	jmp		MJ_L36
	# result is true
MJ_L35:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L36:
	push	r24

MJ_L28:

/* epilogue start for Cloud_inBounds */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Cloud_inBounds, .-Cloud_inBounds

