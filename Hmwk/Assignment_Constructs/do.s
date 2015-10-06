/*
    File: do.s
	Author: Enrique Najera
	Purpose: do-while loop in ARM asm
	07 October 2015
 */

	.global _start
_start:
	MOV R0,  #0 @INIT for output
	MOV R1,  #1 @Index
	MOV R2, #10 @Upperbound
	MOV R3,  #0 @Counter

_do:
	@Do while R3 < R2
	ADD R0, R0, R1
	ADD R1, #1
	ADD R3, #1
	CMP R3, R2
	BNE _do

_exit:
	MOV R7, #1
	SWI 0
	
