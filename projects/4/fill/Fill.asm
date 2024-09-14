// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

(LOOP)
        @SCREEN
	D=A
	@addr
	M=D
	@KBD
	D=M
	@CLEAR
	D; JEQ
(FILL_INNER)
	@KBD
	D=A
	@addr
	D=D-M
	@LOOP
	D; JEQ
	@addr
	A=M
	M=-1
	@addr
	M=M+1
	@FILL_INNER
	0; JMP
(CLEAR)
        @SCREEN
	D=A
	@addr
	M=D
(CLEAR_INNER)
	@KBD
	D=A
	@addr
	D=D-M
	@LOOP
	D; JEQ
	@addr
	A=M
	M=0
	@addr
	M=M+1
	@CLEAR_INNER
	0; JMP
