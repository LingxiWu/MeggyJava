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

	call	Solver_run



/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main

	/* prologue start for function Solver_initMaze1 */
	.text
.global Solver_initMaze1
	.type Solver_initMaze1, @function
Solver_initMaze1:
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
/* done with function Solver_initMaze1 prologue */

/* epilogue start for Solver_initMaze1 */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_initMaze1, .-Solver_initMaze1

	/* prologue start for function Solver_initMaze2 */
	.text
.global Solver_initMaze2
	.type Solver_initMaze2, @function
Solver_initMaze2:
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
/* done with function Solver_initMaze2 prologue */

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

/* epilogue start for Solver_initMaze2 */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_initMaze2, .-Solver_initMaze2

	/* prologue start for function Solver_initMazeCool */
	.text
.global Solver_initMazeCool
	.type Solver_initMazeCool, @function
Solver_initMazeCool:
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
/* done with function Solver_initMazeCool prologue */

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
	# push two byte expression onto stack
	push	r25
	push	r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop		r24
	pop		r25
	push	r24

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

	# Load constant int 5
	ldi		r24,lo8(5)
	ldi		r25,hi8(5)
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

/* epilogue start for Solver_initMazeCool */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_initMazeCool, .-Solver_initMazeCool

	/* prologue start for function Solver_run */
	.text
.global Solver_run
	.type Solver_run, @function
Solver_run:
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
/* done with function Solver_run prologue */

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

	call	Solver_initMazeCool

	# Pushing 'this'
	ldd		r31,Y+2
	ldd		r30,Y+1
	push	r31
	push	r30
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

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

/* epilogue start for Solver_run */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_run, .-Solver_run

	/* prologue start for function Solver_inBounds */
	.text
.global Solver_inBounds
	.type Solver_inBounds, @function
Solver_inBounds:
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
/* done with function Solver_inBounds prologue */

	### short-circuited && op
	# &&: eval left operand

	### short-circuited && op
	# &&: eval left operand

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
	ldd		r24, Y+3
	push	r24

	## less-than check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L0
	ldi		r27, 0
	jmp	MJ_L1
MJ_L0:
	ldi		r27, hi8(-1)
MJ_L1:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L2
	ldi		r27, 0
	jmp	MJ_L3
MJ_L2:
	ldi		r27, hi8(-1)
MJ_L3:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L5
	# result is false
MJ_L4:
	ldi		r24, 0
	jmp		MJ_L6
	# result is true
MJ_L5:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L6:
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L7
	brne	MJ_L8
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L7

MJ_L8:
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
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
	brlt	MJ_L9
	ldi		r27, 0
	jmp	MJ_L10
MJ_L9:
	ldi		r27, hi8(-1)
MJ_L10:
	push	r27
	push	r26
	# load a two-byte expression off stack
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
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L14
	# result is false
MJ_L13:
	ldi		r24, 0
	jmp		MJ_L15
	# result is true
MJ_L14:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L15:
	push	r24

MJ_L7:

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L16
	brne	MJ_L17
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L16

MJ_L17:
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
	brlt	MJ_L18
	ldi		r27, 0
	jmp	MJ_L19
MJ_L18:
	ldi		r27, hi8(-1)
MJ_L19:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L20
	ldi		r27, 0
	jmp	MJ_L21
MJ_L20:
	ldi		r27, hi8(-1)
MJ_L21:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L23
	# result is false
MJ_L22:
	ldi		r24, 0
	jmp		MJ_L24
	# result is true
MJ_L23:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L24:
	push	r24

MJ_L16:

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L25
	brne	MJ_L26
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L25

MJ_L26:
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
	brlt	MJ_L27
	ldi		r27, 0
	jmp	MJ_L28
MJ_L27:
	ldi		r27, hi8(-1)
MJ_L28:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L29
	ldi		r27, 0
	jmp	MJ_L30
MJ_L29:
	ldi		r27, hi8(-1)
MJ_L30:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L32
	# result is false
MJ_L31:
	ldi		r24, 0
	jmp		MJ_L33
	# result is true
MJ_L32:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L33:
	push	r24

MJ_L25:

/* epilogue start for Solver_inBounds */
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
	.size Solver_inBounds, .-Solver_inBounds

	/* prologue start for function Solver_isDark */
	.text
.global Solver_isDark
	.type Solver_isDark, @function
Solver_isDark:
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
/* done with function Solver_isDark prologue */

	### short-circuited && op
	# &&: eval left operand

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

	call	Solver_inBounds

	# handle return value
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L34
	brne	MJ_L35
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L34

MJ_L35:
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
	brlt	MJ_L36
	ldi		r27, 0
	jmp	MJ_L37
MJ_L36:
	ldi		r27, hi8(-1)
MJ_L37:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L38
	ldi		r27, 0
	jmp	MJ_L39
MJ_L38:
	ldi		r27, hi8(-1)
MJ_L39:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L41
	# result is false
MJ_L40:
	ldi		r24, 0
	jmp		MJ_L42
	# result is true
MJ_L41:
	ldi		r24, 1
	# store result of equal expression
MJ_L42:
	push	r24

MJ_L34:

/* epilogue start for Solver_isDark */
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
	.size Solver_isDark, .-Solver_isDark

	/* prologue start for function Solver_isBLUE */
	.text
.global Solver_isBLUE
	.type Solver_isBLUE, @function
Solver_isBLUE:
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
/* done with function Solver_isBLUE prologue */

	### short-circuited && op
	# &&: eval left operand

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

	call	Solver_inBounds

	# handle return value
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L43
	brne	MJ_L44
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L43

MJ_L44:
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

### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop		r22
	# load a one byte expression off stack
	pop		r24
	call	_Z6ReadPxhh
	# push result color onto stack
	push	r24

	# Color expression Meggy.Color.BLUE
	# load a one byte expression off stack
	ldi		r22,5
	# load a one byte expression off stack
	push	r22

	## equality check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L45
	ldi		r27, 0
	jmp	MJ_L46
MJ_L45:
	ldi		r27, hi8(-1)
MJ_L46:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L47
	ldi		r27, 0
	jmp	MJ_L48
MJ_L47:
	ldi		r27, hi8(-1)
MJ_L48:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L50
	# result is false
MJ_L49:
	ldi		r24, 0
	jmp		MJ_L51
	# result is true
MJ_L50:
	ldi		r24, 1
	# store result of equal expression
MJ_L51:
	push	r24

MJ_L43:

/* epilogue start for Solver_isBLUE */
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
	.size Solver_isBLUE, .-Solver_isBLUE

	/* prologue start for function Solver_findTargetOrMove */
	.text
.global Solver_findTargetOrMove
	.type Solver_findTargetOrMove, @function
Solver_findTargetOrMove:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
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
	std		Y+6,r16
/* done with function Solver_findTargetOrMove prologue */

	#### if statement

	### short-circuited && op
	# &&: eval left operand

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	## equality check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L55
	ldi		r27, 0
	jmp	MJ_L56
MJ_L55:
	ldi		r27, hi8(-1)
MJ_L56:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L57
	ldi		r27, 0
	jmp	MJ_L58
MJ_L57:
	ldi		r27, hi8(-1)
MJ_L58:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L60
	# result is false
MJ_L59:
	ldi		r24, 0
	jmp		MJ_L61
	# result is true
MJ_L60:
	ldi		r24, 1
	# store result of equal expression
MJ_L61:
	push	r24

	# &&: if left operand is false do not eval right
	# load a one byte expression off stack
	pop		r24
	# compare left exp with zero
	ldi		r25, 0
	cp		r24, r25
	# Want this, breq MJ_L62
	brne	MJ_L63
	# We're skipping right exp, so push left val (false) for eval
	push	r24
	jmp		MJ_L62

MJ_L63:
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	## equality check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L64
	ldi		r27, 0
	jmp	MJ_L65
MJ_L64:
	ldi		r27, hi8(-1)
MJ_L65:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L66
	ldi		r27, 0
	jmp	MJ_L67
MJ_L66:
	ldi		r27, hi8(-1)
MJ_L67:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	breq	MJ_L69
	# result is false
MJ_L68:
	ldi		r24, 0
	jmp		MJ_L70
	# result is true
MJ_L69:
	ldi		r24, 1
	# store result of equal expression
MJ_L70:
	push	r24

MJ_L62:

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L53
	brne	MJ_L52
	jmp		MJ_L53

	# then label for if
MJ_L52:

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

# skip else clause
	jmp	MJ_L54

	# else label for if
MJ_L53:

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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

	# done label for if
MJ_L54:

/* epilogue start for Solver_findTargetOrMove */
	# no return value
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
	.size Solver_findTargetOrMove, .-Solver_findTargetOrMove

	/* prologue start for function Solver_move */
	.text
.global Solver_move
	.type Solver_move, @function
Solver_move:
	push	r29
	push	r28
	# make space for locals and params
	ldi		r30, 0
	push	r30
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
	std		Y+6,r16
/* done with function Solver_move prologue */

	# Load constant int 256
	ldi		r24,lo8(256)
	ldi		r25,hi8(256)
	# push two byte expression onto stack
	push	r25
	push	r24

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop		r24
	pop		r25
	call	_Z8delay_msj

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
	brlt	MJ_L74
	ldi		r27, 0
	jmp	MJ_L75
MJ_L74:
	ldi		r27, hi8(-1)
MJ_L75:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L76
	ldi		r27, 0
	jmp	MJ_L77
MJ_L76:
	ldi		r27, hi8(-1)
MJ_L77:
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

	call	Solver_isDark

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L72
	brne	MJ_L71
	jmp		MJ_L72

	# then label for if
MJ_L71:

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
	brlt	MJ_L78
	ldi		r27, 0
	jmp	MJ_L79
MJ_L78:
	ldi		r27, hi8(-1)
MJ_L79:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L80
	ldi		r27, 0
	jmp	MJ_L81
MJ_L80:
	ldi		r27, hi8(-1)
MJ_L81:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_findTargetOrMove

# skip else clause
	jmp	MJ_L73

	# else label for if
MJ_L72:

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
	brlt	MJ_L85
	ldi		r27, 0
	jmp	MJ_L86
MJ_L85:
	ldi		r27, hi8(-1)
MJ_L86:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L87
	ldi		r27, 0
	jmp	MJ_L88
MJ_L87:
	ldi		r27, hi8(-1)
MJ_L88:
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

	call	Solver_isDark

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L83
	brne	MJ_L82
	jmp		MJ_L83

	# then label for if
MJ_L82:

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
	brlt	MJ_L89
	ldi		r27, 0
	jmp	MJ_L90
MJ_L89:
	ldi		r27, hi8(-1)
MJ_L90:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L91
	ldi		r27, 0
	jmp	MJ_L92
MJ_L91:
	ldi		r27, hi8(-1)
MJ_L92:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_findTargetOrMove

# skip else clause
	jmp	MJ_L84

	# else label for if
MJ_L83:

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
	brlt	MJ_L96
	ldi		r27, 0
	jmp	MJ_L97
MJ_L96:
	ldi		r27, hi8(-1)
MJ_L97:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L98
	ldi		r27, 0
	jmp	MJ_L99
MJ_L98:
	ldi		r27, hi8(-1)
MJ_L99:
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

	call	Solver_isDark

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L94
	brne	MJ_L93
	jmp		MJ_L94

	# then label for if
MJ_L93:

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
	brlt	MJ_L100
	ldi		r27, 0
	jmp	MJ_L101
MJ_L100:
	ldi		r27, hi8(-1)
MJ_L101:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L102
	ldi		r27, 0
	jmp	MJ_L103
MJ_L102:
	ldi		r27, hi8(-1)
MJ_L103:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_findTargetOrMove

# skip else clause
	jmp	MJ_L95

	# else label for if
MJ_L94:

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
	brlt	MJ_L107
	ldi		r27, 0
	jmp	MJ_L108
MJ_L107:
	ldi		r27, hi8(-1)
MJ_L108:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L109
	ldi		r27, 0
	jmp	MJ_L110
MJ_L109:
	ldi		r27, hi8(-1)
MJ_L110:
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

	call	Solver_isDark

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L105
	brne	MJ_L104
	jmp		MJ_L105

	# then label for if
MJ_L104:

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
	brlt	MJ_L111
	ldi		r27, 0
	jmp	MJ_L112
MJ_L111:
	ldi		r27, hi8(-1)
MJ_L112:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L113
	ldi		r27, 0
	jmp	MJ_L114
MJ_L113:
	ldi		r27, hi8(-1)
MJ_L114:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_findTargetOrMove

# skip else clause
	jmp	MJ_L106

	# else label for if
MJ_L105:

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
	brlt	MJ_L118
	ldi		r27, 0
	jmp	MJ_L119
MJ_L118:
	ldi		r27, hi8(-1)
MJ_L119:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L120
	ldi		r27, 0
	jmp	MJ_L121
MJ_L120:
	ldi		r27, hi8(-1)
MJ_L121:
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

	call	Solver_isBLUE

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L116
	brne	MJ_L115
	jmp		MJ_L116

	# then label for if
MJ_L115:

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

	# Color expression Meggy.Color.YELLOW
	# load a one byte expression off stack
	ldi		r22,3
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
	brlt	MJ_L122
	ldi		r27, 0
	jmp	MJ_L123
MJ_L122:
	ldi		r27, hi8(-1)
MJ_L123:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L124
	ldi		r27, 0
	jmp	MJ_L125
MJ_L124:
	ldi		r27, hi8(-1)
MJ_L125:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

# skip else clause
	jmp	MJ_L117

	# else label for if
MJ_L116:

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
	brlt	MJ_L129
	ldi		r27, 0
	jmp	MJ_L130
MJ_L129:
	ldi		r27, hi8(-1)
MJ_L130:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L131
	ldi		r27, 0
	jmp	MJ_L132
MJ_L131:
	ldi		r27, hi8(-1)
MJ_L132:
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

	call	Solver_isBLUE

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L127
	brne	MJ_L126
	jmp		MJ_L127

	# then label for if
MJ_L126:

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

	# Color expression Meggy.Color.YELLOW
	# load a one byte expression off stack
	ldi		r22,3
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
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
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
	brlt	MJ_L133
	ldi		r27, 0
	jmp	MJ_L134
MJ_L133:
	ldi		r27, hi8(-1)
MJ_L134:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L135
	ldi		r27, 0
	jmp	MJ_L136
MJ_L135:
	ldi		r27, hi8(-1)
MJ_L136:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

# skip else clause
	jmp	MJ_L128

	# else label for if
MJ_L127:

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
	brlt	MJ_L140
	ldi		r27, 0
	jmp	MJ_L141
MJ_L140:
	ldi		r27, hi8(-1)
MJ_L141:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L142
	ldi		r27, 0
	jmp	MJ_L143
MJ_L142:
	ldi		r27, hi8(-1)
MJ_L143:
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

	call	Solver_isBLUE

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L138
	brne	MJ_L137
	jmp		MJ_L138

	# then label for if
MJ_L137:

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

	# Color expression Meggy.Color.YELLOW
	# load a one byte expression off stack
	ldi		r22,3
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
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	#casting byte to byte: do nothing

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
	brlt	MJ_L144
	ldi		r27, 0
	jmp	MJ_L145
MJ_L144:
	ldi		r27, hi8(-1)
MJ_L145:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L146
	ldi		r27, 0
	jmp	MJ_L147
MJ_L146:
	ldi		r27, hi8(-1)
MJ_L147:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

# skip else clause
	jmp	MJ_L139

	# else label for if
MJ_L138:

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
	brlt	MJ_L151
	ldi		r27, 0
	jmp	MJ_L152
MJ_L151:
	ldi		r27, hi8(-1)
MJ_L152:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L153
	ldi		r27, 0
	jmp	MJ_L154
MJ_L153:
	ldi		r27, hi8(-1)
MJ_L154:
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

	call	Solver_isBLUE

	# handle return value
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L149
	brne	MJ_L148
	jmp		MJ_L149

	# then label for if
MJ_L148:

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

	# Color expression Meggy.Color.YELLOW
	# load a one byte expression off stack
	ldi		r22,3
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
	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
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
	brlt	MJ_L155
	ldi		r27, 0
	jmp	MJ_L156
MJ_L155:
	ldi		r27, hi8(-1)
MJ_L156:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L157
	ldi		r27, 0
	jmp	MJ_L158
MJ_L157:
	ldi		r27, hi8(-1)
MJ_L158:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+6
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r16
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_move

# skip else clause
	jmp	MJ_L150

	# else label for if
MJ_L149:

	# done label for if
MJ_L150:

	# done label for if
MJ_L139:

	# done label for if
MJ_L128:

	# done label for if
MJ_L117:

	# done label for if
MJ_L106:

	# done label for if
MJ_L95:

	# done label for if
MJ_L84:

	# done label for if
MJ_L73:

/* epilogue start for Solver_move */
	# no return value
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
	.size Solver_move, .-Solver_move

	/* prologue start for function Solver_mazeRow */
	.text
.global Solver_mazeRow
	.type Solver_mazeRow, @function
Solver_mazeRow:
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
/* done with function Solver_mazeRow prologue */

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+3
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
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

	#### if statement

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

	## less-than check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L162
	ldi		r27, 0
	jmp	MJ_L163
MJ_L162:
	ldi		r27, hi8(-1)
MJ_L163:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L164
	ldi		r27, 0
	jmp	MJ_L165
MJ_L164:
	ldi		r27, hi8(-1)
MJ_L165:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L167
	# result is false
MJ_L166:
	ldi		r24, 0
	jmp		MJ_L168
	# result is true
MJ_L167:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L168:
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L160
	brne	MJ_L159
	jmp		MJ_L160

	# then label for if
MJ_L159:

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
	brlt	MJ_L169
	ldi		r27, 0
	jmp	MJ_L170
MJ_L169:
	ldi		r27, hi8(-1)
MJ_L170:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L171
	ldi		r27, 0
	jmp	MJ_L172
MJ_L171:
	ldi		r27, hi8(-1)
MJ_L172:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeRow

# skip else clause
	jmp	MJ_L161

	# else label for if
MJ_L160:

	# done label for if
MJ_L161:

/* epilogue start for Solver_mazeRow */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30
	pop		r30
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_mazeRow, .-Solver_mazeRow

	/* prologue start for function Solver_mazeCol */
	.text
.global Solver_mazeCol
	.type Solver_mazeCol, @function
Solver_mazeCol:
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
/* done with function Solver_mazeCol prologue */

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

	#### if statement

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+4
	push	r24

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	## less-than check expression
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L176
	ldi		r27, 0
	jmp	MJ_L177
MJ_L176:
	ldi		r27, hi8(-1)
MJ_L177:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L178
	ldi		r27, 0
	jmp	MJ_L179
MJ_L178:
	ldi		r27, hi8(-1)
MJ_L179:
	push	r27
	push	r26
	# load a two-byte expression off stack
	pop		r24
	pop		r25
	cp		r24, r18
	cpc		r25, r19
	brlt	MJ_L181
	# result is false
MJ_L180:
	ldi		r24, 0
	jmp		MJ_L182
	# result is true
MJ_L181:
	ldi		r24, 1
	# store result of less than (one byte)
MJ_L182:
	push	r24

	# load condition and branch if false
	# load a boolean expression off stack
	pop		r24
	#load zero into reg
	ldi		r25, 0
	#use cp to set SREG
	cp		r24, r25
	#WANT breq MJ_L174
	brne	MJ_L173
	jmp		MJ_L174

	# then label for if
MJ_L173:

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
	brlt	MJ_L183
	ldi		r27, 0
	jmp	MJ_L184
MJ_L183:
	ldi		r27, hi8(-1)
MJ_L184:
	push	r27
	push	r26
	# load an int off stack
	pop		r18
	pop		r19
	#promoting a byte to an int
	pop		r26
	tst		r26
	brlt	MJ_L185
	ldi		r27, 0
	jmp	MJ_L186
MJ_L185:
	ldi		r27, hi8(-1)
MJ_L186:
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

	# IdExp:
	# load into register using base,offset
	# push onto stack
	ldd		r24, Y+5
	push	r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	# next arg
	pop		r18
	# next arg
	pop		r20
	# next arg
	pop		r22
	# receiver
	pop		r24
	pop		r25

	call	Solver_mazeCol

# skip else clause
	jmp	MJ_L175

	# else label for if
MJ_L174:

	# done label for if
MJ_L175:

/* epilogue start for Solver_mazeCol */
	# no return value
	# pop receiver
	pop		r30
	pop		r30
	# pop space off stack for parameters and locals
	pop		r30
	pop		r30
	pop		r30

	# restoring the frame pointer
	pop		r28
	pop		r29

	ret
	.size Solver_mazeCol, .-Solver_mazeCol

