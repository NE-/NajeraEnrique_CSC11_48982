/*
	File:    div.s
	Author:  Enrique Najera
	Purpose: Find quotient of two 
	         ints using subtraction 
			 and loops only
	28 September 2015
 */

	.global _start
_start:
	MOV R0, #0      @counter initialized
	MOV R1, #16     @numerator
	MOV R2, #3      @denominator
    
loop:
	SUBS R1, R1, R2
	ADD  R0, R0, #1  @If subtracted R0++
	CMP  R1, #1      @Is R1 < 1?
	BGT  loop        @If false, subtract again

_exit:
	MOV R7, #1      @SYS_EXIT
	SWI 0

