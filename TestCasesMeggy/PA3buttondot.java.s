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
	#### if statement

	# Button expression Meggy.Button.A
	ldi		r22,2
	# push onto stack as single byte
	push	r22

	### MeggyCheckButton
	call	_Z16CheckButtonsDownv
	lds		r24, Button_A
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

	# Color expression Meggy.Color.VIOLET
	# load a one byte expression off stack
	ldi		r22,6
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
	jmp	MJ_L5

	# else label for if
MJ_L4:

	#### if statement

	# Button expression Meggy.Button.B
	ldi		r22,1
	# push onto stack as single byte
	push	r22

	### MeggyCheckButton
	call	_Z16CheckButtonsDownv
	lds		r24, Button_B
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

	# Color expression Meggy.Color.GREEN
	# load a one byte expression off stack
	ldi		r22,4
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

	# done label for if
MJ_L8:

	# done label for if
MJ_L5:

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
	jmp	MJ_L0

	# end of while
MJ_L2:



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

