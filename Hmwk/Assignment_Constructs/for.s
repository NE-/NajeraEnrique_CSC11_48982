/*
    File:    for.s
	Author:  Enrique Najera
	Purpose: for loop in ARM asm
	07 October 2015
 */

 	.global _start
_start:
	MOV R0,  #0 @INIT for output
	MOV R1,  #1 @Index
	MOV R2, #10 @Upper bound
	MOV R3,  #0 @counter

_for:
	@R3 = 0_R3 < R2_R3++
	ADD R0, R0, R1
	ADD R1, #1
	ADD R3, #1
	CMP R3, R2
	BNE _for
	BEQ _exit

_exit:
	MOV R7, #1
	SWI 0
