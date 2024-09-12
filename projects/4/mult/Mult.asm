// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

	// Before going into the loop check for zero values
	@mult
	M=0

	@R0
	D=M
	@OUTPUT
	D			; JEQ

	@R1
	D=M
	@OUTPUT
	D			; JEQ

	// i = 0
	@i
	M=1

	// if R0 or R1 are not zero then mult = R0
	@R0
	D=M
	@mult
	M=D

	(LOOP)
	// if i > R1 goto STOP
	@i
	D=M
	@R1
	D=D-M
	@OUTPUT
	D			;JGE

	// mult = mult + R0
	@mult
	D=M
	@R0
	D=D+M
	@mult
	M=D

	// n = n + 1
	@i
	M=M+1

	@LOOP
	0			;JMP

	(OUTPUT)
	// R2 = mult
	@mult
	D=M
	@R2
	M=D

	(END)
	@END
	0			;JMP
