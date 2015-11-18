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

	#### if statement

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L1
	brne	MJ_L0
	jmp		MJ_L1

	# then label for if
MJ_L0:

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

	#### if statement

	# False literal
	ldi		r22,0
	# push onto stack as single byte
	push	r22

	# not operation
	# load a one byte expression off stack
	pop		r24
	ldi		r22, 1
	eor		r24,r22
	# push one byte expression onto stack
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

# skip else clause
	jmp	MJ_L5

	# else label for if
MJ_L4:

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

	# done label for if
MJ_L5:

# skip else clause
	jmp	MJ_L2

	# else label for if
MJ_L1:

	# done label for if
MJ_L2:

	#### if statement

	# False literal
	ldi		r22,0
	# push onto stack as single byte
	push	r22

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

	#### if statement

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	# not operation
	# load a one byte expression off stack
	pop		r24
	ldi		r22, 1
	eor		r24,r22
	# push one byte expression onto stack
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L10
	brne	MJ_L9
	jmp		MJ_L10

	# then label for if
MJ_L9:

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

# skip else clause
	jmp	MJ_L11

	# else label for if
MJ_L10:

	# done label for if
MJ_L11:

# skip else clause
	jmp	MJ_L8

	# else label for if
MJ_L7:

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

	# done label for if
MJ_L8:

	#### if statement

	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt1

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L13
	brne	MJ_L12
	jmp		MJ_L13

	# then label for if
MJ_L12:

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

# skip else clause
	jmp	MJ_L14

	# else label for if
MJ_L13:

	# done label for if
MJ_L14:

	#### if statement

	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt2

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L16
	brne	MJ_L15
	jmp		MJ_L16

	# then label for if
MJ_L15:

	# Meggy Tone expression Meggy.Tone.C3
	ldi		r25, hi8(61157)
	ldi		r24, lo8(61157)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.Cs3
	ldi		r25, hi8(57724)
	ldi		r24, lo8(57724)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.D3
	ldi		r25, hi8(54485)
	ldi		r24, lo8(54485)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.Ds3
	ldi		r25, hi8(51427)
	ldi		r24, lo8(51427)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.E3
	ldi		r25, hi8(48541)
	ldi		r24, lo8(48541)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.F3
	ldi		r25, hi8(45816)
	ldi		r24, lo8(45816)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.Fs3
	ldi		r25, hi8(43243)
	ldi		r24, lo8(43243)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.G3
	ldi		r25, hi8(40816)
	ldi		r24, lo8(40816)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.Gs3
	ldi		r25, hi8(38526)
	ldi		r24, lo8(38526)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.A3
	ldi		r25, hi8(36363)
	ldi		r24, lo8(36363)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.As3
	ldi		r25, hi8(34323)
	ldi		r24, lo8(34323)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	# Meggy Tone expression Meggy.Tone.B3
	ldi		r25, hi8(32397)
	ldi		r24, lo8(32397)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

# skip else clause
	jmp	MJ_L17

	# else label for if
MJ_L16:

	# done label for if
MJ_L17:

	#### if statement

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# load an int off stack
	pop		r18
	pop		r19
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 3
	ldi		r24,lo8(3)
	ldi		r25,hi8(3)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 4
	ldi		r24,lo8(4)
	ldi		r25,hi8(4)
	# push two byte expression onto stack
	push	r25
	push	r24

	# negating int
	# load an int off stack
	pop		r24
	pop		r25
	ldi		r22, 0
	ldi		r23, 0
	sub		r22, r24
	sbc		r23, r25
	# push two byte expression onto stack
	push	r23
	push	r22

	# load an int off stack
	pop		r18
	pop		r19
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	## equality check expression
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L22
	# result is false
MJ_L21:
	ldi		r24, 0
	jmp		MJ_L23
	# result is true
MJ_L22:
	ldi		r24, 1
	# store result of equal expression
MJ_L23:
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L19
	brne	MJ_L18
	jmp		MJ_L19

	# then label for if
MJ_L18:

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

# skip else clause
	jmp	MJ_L20

	# else label for if
MJ_L19:

	# done label for if
MJ_L20:

	#### if statement

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
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
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 4
	ldi		r24,lo8(4)
	ldi		r25,hi8(4)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# negating int
	# load an int off stack
	pop		r24
	pop		r25
	ldi		r22, 0
	ldi		r23, 0
	sub		r22, r24
	sbc		r23, r25
	# push two byte expression onto stack
	push	r23
	push	r22

	# load an int off stack
	pop		r18
	pop		r19
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	## less-than check expression
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L28
	# result is false
MJ_L27:
	ldi		r24, 0
	jmp		MJ_L29
	# result is true
MJ_L28:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L29:
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L25
	brne	MJ_L24
	jmp		MJ_L25

	# then label for if
MJ_L24:

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

# skip else clause
	jmp	MJ_L26

	# else label for if
MJ_L25:

	# done label for if
MJ_L26:

	#### if statement

	### short-circuited && op
	# &&: eval left operand

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 3
	ldi		r24,lo8(3)
	ldi		r25,hi8(3)
	# push two byte expression onto stack
	push	r25
	push	r24

	# load an int off stack
	pop		r18
	pop		r19
	# load an int off stack
	pop		r24
	pop		r25
	# Do add operation
	add		r24, r18
	adc		r25, r19
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 3
	ldi		r24,lo8(3)
	ldi		r25,hi8(3)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 4
	ldi		r24,lo8(4)
	ldi		r25,hi8(4)
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

	## equality check expression
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L34
	# result is false
MJ_L33:
	ldi		r24, 0
	jmp		MJ_L35
	# result is true
MJ_L34:
	ldi		r24, 1
	# store result of equal expression
MJ_L35:
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L36
	brne	MJ_L37
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L36

MJ_L37:
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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Multiplication (BYTE x BYTE ONLY! Returns int)
	# load a byte off stack
	pop		r18
	# load a byte off stack
	pop		r22
	# move one byte src into dest reg
	mov		r24, r18
	# move one byte src into dest reg
	mov		r26, r22
	# Do mul operation of two input bytes
	muls	r24, r26
	# push two-byte expression onto stack
	push	r1
	push	r0
	# clear r0 and r1
	eor		r0,r0
	eor		r1,r1

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

	# Load constant int 4
	ldi		r24,lo8(4)
	ldi		r25,hi8(4)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Multiplication (BYTE x BYTE ONLY! Returns int)
	# load a byte off stack
	pop		r18
	# load a byte off stack
	pop		r22
	# move one byte src into dest reg
	mov		r24, r18
	# move one byte src into dest reg
	mov		r26, r22
	# Do mul operation of two input bytes
	muls	r24, r26
	# push two-byte expression onto stack
	push	r1
	push	r0
	# clear r0 and r1
	eor		r0,r0
	eor		r1,r1

	## equality check expression
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L39
	# result is false
MJ_L38:
	ldi		r24, 0
	jmp		MJ_L40
	# result is true
MJ_L39:
	ldi		r24, 1
	# store result of equal expression
MJ_L40:
	push	r24

MJ_L36:

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L31
	brne	MJ_L30
	jmp		MJ_L31

	# then label for if
MJ_L30:

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

# skip else clause
	jmp	MJ_L32

	# else label for if
MJ_L31:

	# done label for if
MJ_L32:

	#### if statement

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

### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6ReadPxhh
	# push result color onto stack
	push	r24

	# Color expression Meggy.Color.DARK
	# load a one byte expression off stack
	ldi		r22,0
	# load a one byte expression off stack
	push	r22

	## equality check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L44
	ldi		r27, 0
	jmp	MJ_L45
MJ_L44:
	ldi		r27, hi8(-1)
MJ_L45:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L46
	ldi		r27, 0
	jmp	MJ_L47
MJ_L46:
	ldi		r27, hi8(-1)
MJ_L47:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L49
	# result is false
MJ_L48:
	ldi		r24, 0
	jmp		MJ_L50
	# result is true
MJ_L49:
	ldi		r24, 1
	# store result of equal expression
MJ_L50:
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L42
	brne	MJ_L41
	jmp		MJ_L42

	# then label for if
MJ_L41:

	#### while statement
MJ_L51:

	# Button expression Meggy.Button.B
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	### MeggyCheckButton
	call	_Z16CheckButtonsDownv
	lds		r24, Button_B
	push	r24

	# check condition, jump if false
	# load a boolean expression off stack
	pop		r24
	ldi		r25,0
	cp		r24, r25
	# WANT breq MJ_L53
	brne	MJ_L52
	jmp		MJ_L53

	# while loop body
MJ_L52:
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

	# jump to while test
	jmp	MJ_L51

	# end of while
MJ_L53:

# skip else clause
	jmp	MJ_L43

	# else label for if
MJ_L42:

	# done label for if
MJ_L43:

	#### while statement
MJ_L54:

	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt2

	# handle return value
	push	r24

	# check condition, jump if false
	# load a boolean expression off stack
	pop		r24
	ldi		r25,0
	cp		r24, r25
	# WANT breq MJ_L56
	brne	MJ_L55
	jmp		MJ_L56

	# while loop body
MJ_L55:
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

	# jump to while test
	jmp	MJ_L54

	# end of while
MJ_L56:

	# Meggy Tone expression Meggy.Tone.A3
	ldi		r25, hi8(36363)
	ldi		r24, lo8(36363)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Load constant int 1
	ldi		r24,lo8(1)
	ldi		r25,hi8(1)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop		r22
	pop		r23
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z10Tone_Startjj

	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt1

	# handle return value
	push	r24

	#NewExp
	ldi		r24, lo8(0)
	ldi		r25, hi8(0)
	# allocating object of size 0 on heap
	call	malloc
	# push object address
	# push two byte expression onto stack
	push	r25
	push	r24

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt2

	# handle return value
	push	r24



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

	/* prologue start for function newclass1_newmt1 */
	.text
.global newclass1_newmt1
	.type newclass1_newmt1, @function
newclass1_newmt1:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
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
/* done with function newclass1_newmt1 prologue */

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

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

/* epilogue start for newclass1_newmt1 */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass1_newmt1, .-newclass1_newmt1

	/* prologue start for function newclass2_newmt1 */
	.text
.global newclass2_newmt1
	.type newclass2_newmt1, @function
newclass2_newmt1:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
	push	r30

	# copy stack pointer to frame pointer
	in		r28, __SP_L__
	in		r29, __SP_H__

	# save off parameters
	std		Y+2,r25
	std		Y+1,r24
/* done with function newclass2_newmt1 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# False literal
	ldi		r22,0
	# push onto stack as single byte
	push	r22

/* epilogue start for newclass2_newmt1 */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass2_newmt1, .-newclass2_newmt1

	/* prologue start for function newclass2_newmt2 */
	.text
.global newclass2_newmt2
	.type newclass2_newmt2, @function
newclass2_newmt2:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
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
/* done with function newclass2_newmt2 prologue */

	#### if statement

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L60
	brne	MJ_L59
	jmp		MJ_L60

	# then label for if
MJ_L59:

# skip else clause
	jmp	MJ_L61

	# else label for if
MJ_L60:

	# done label for if
MJ_L61:

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# True/1 expression
	ldi		r22,1
	# push onto stack as single byte
	push	r22

/* epilogue start for newclass2_newmt2 */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass2_newmt2, .-newclass2_newmt2

	/* prologue start for function newclass2_newmt3 */
	.text
.global newclass2_newmt3
	.type newclass2_newmt3, @function
newclass2_newmt3:
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
/* done with function newclass2_newmt3 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# receiver
	pop		r24
	pop		r25

	call	newclass2_newmt1

	# handle return value
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

/* epilogue start for newclass2_newmt3 */
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
	.size newclass2_newmt3, .-newclass2_newmt3

	/* prologue start for function newclass2_newmt4 */
	.text
.global newclass2_newmt4
	.type newclass2_newmt4, @function
newclass2_newmt4:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
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
	std		Y+5,r18
/* done with function newclass2_newmt4 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

/* epilogue start for newclass2_newmt4 */
	# handle return value
	pop		r24
	pop		r25
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30
	pop		r30
	pop		r30
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass2_newmt4, .-newclass2_newmt4

	/* prologue start for function newclass2_newmt5 */
	.text
.global newclass2_newmt5
	.type newclass2_newmt5, @function
newclass2_newmt5:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
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
/* done with function newclass2_newmt5 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# Color expression Meggy.Color.DARK
	# load a one byte expression off stack
	ldi		r22,0
	# load a one byte expression off stack
	push	r22

/* epilogue start for newclass2_newmt5 */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass2_newmt5, .-newclass2_newmt5

	/* prologue start for function newclass2_newmt6 */
	.text
.global newclass2_newmt6
	.type newclass2_newmt6, @function
newclass2_newmt6:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
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
/* done with function newclass2_newmt6 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# Button expression Meggy.Button.Up
	ldi		r22,4
	# push onto stack as single byte
	push	r22

/* epilogue start for newclass2_newmt6 */
	# handle return value
	pop		r24
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size newclass2_newmt6, .-newclass2_newmt6

	/* prologue start for function newclass2_newmt7 */
	.text
.global newclass2_newmt7
	.type newclass2_newmt7, @function
newclass2_newmt7:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
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
/* done with function newclass2_newmt7 prologue */

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

	# Load constant int 2
	ldi		r24,lo8(2)
	ldi		r25,hi8(2)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Color expression Meggy.Color.RED
	# load a one byte expression off stack
	ldi		r22,1
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

	# Meggy Tone expression Meggy.Tone.A3
	ldi		r25, hi8(36363)
	ldi		r24, lo8(36363)
	# push two byte expression onto stack
	push	r25
	push	r24

/* epilogue start for newclass2_newmt7 */
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
	.size newclass2_newmt7, .-newclass2_newmt7

