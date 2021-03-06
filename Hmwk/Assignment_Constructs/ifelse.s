/*
	File:    ifelse.s
	Author:  Enrique Najera
	Purpose: if else statement in ARM asm
	07 October 2015
 */

	.global _start
_start:
_prompt:
	@Prompt for user input
	MOV R7, #4
	MOV R0, #1
	LDR R1, =promptMsg
	MOV R2, #32
	SWI 0

_read:
	@Get user input week day
	MOV R7, #3
	MOV R0, #0
	LDR R1, =wkDay
	MOV R2, #1
	SWI 0
	
	LDR R1, [R1] @Load address R1 into R1
	SUB R1, #48  @Convert char to int

_if_R1_EQ_1_or_3:
	@If R1 == 1 or 3 then CSC11
	CMP R1, #1
	BEQ _CSC11
	CMP R1, #3
	BEQ _CSC11
	BNE _else_if_R1_EQ_2_or_4

_else_if_R1_EQ_2_or_4:
	@If R1 == 2 or 4 then CSC5
	CMP R1, #2
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5
	BNE _else_if_R1_EQ_5

_else_if_R1_EQ_5:
	@If R1 == 5 then CIS 1A
	CMP R1, #5
	BEQ _CIS1A
	BNE _else
	
_else:
	@If any other value R0 = 0
	BAL _zero

_CSC11:
	MOV R0, #11
	BAL _exit

_CSC5:
	MOV R0, #5
	BAL _exit

_CIS1A:
	MOV R0, #1
	BAL _exit

_zero:
	MOV R0, #0
	BAL _exit

_exit:
	@SYS_EXIT
	MOV R7, #1
	SWI 0

.data
promptMsg:
	.ascii "Enter 1 - 5 for day of the week "
wkDay:
	.word 0
