/*
	File:    mod.s
	Author:  Enrique Najera
	Purpose: Find modulus of two 
	         ints using subtraction 
			 and loops only
	28 September 2015
 */

	.global _start
_start:
	MOV R1, #16     @numerator
	MOV R2, #3      @denominator
    
loop:
	SUBS R1, R1, R2
	CMP  R1, #1     @Is R1 < 1?
	BGT  loop       @If false, subtract again
	MOV  R0, R1     @Else move for output

_exit:
	MOV R7, #1      @SYS_EXIT
	SWI 0

