/*
	File:    DivModShift.s
	Author:  Enrique Najera
	Purpose: 1) Shift left until denominator is just less than the numerator
	         2) Subtract denominator from shifted numerator, increment the shifted division
	         3)  Shift the denominator right until just less than what is left from the numerator after subtraction
	         4) Repeat 2) until the increment for the shifted division is no more than 1
	         5) Output the results, either div or mod.
*/

	.global _start
_start:
	MOV R0,  #0 
	MOV R1, #45 @Numerator
	MOV R2,  #6 @Denominator
	MOV R3,  #1 @Scale
	MOV R4,  #6 @Original
	MOV R5,  #4 @Scale

_while_R4_GT_R1:
	CMP R1, R4
	BLT _exit
		CMP R4, R1          @If  R4 < R1 LSL
		BLT _lshift
	BAL _while_R4_GT_R1 

_lshift:
	CMP R4, R1
	BGT _rshift             @If R4 < R1 LSR and SUB
		MOVS R4, R2, LSL R3
		ADD R3, R3, #1      @Increment scale
	BAL _lshift

_rshift:
	MOVS R4, R4, LSR #1     @Shift right since too big
	SUB R1, R1, R4      
	MOV R4, R2              @INIT denominator
	MOV R3, #1              @Reset scale
	MOV R0, R1              @Move numerator for output
	B _while_R4_GT_R1   

_exit:
	MOV R7, #1
	SWI 0

