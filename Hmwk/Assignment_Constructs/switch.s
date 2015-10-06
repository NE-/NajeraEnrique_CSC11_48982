/*
	File: switch.s
	Author: Enrique Najera
	Purpose: if statement in ARM asm
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

_switch_R1:
	@Case 1 or 3 is CSC11
	CMP R1, #1
	BEQ _CSC11
	CMP R1, #3
	BEQ _CSC11
	
	@Case 2 or 4 is CSC5
	CMP R1, #2
	BEQ _CSC5
	CMP R1, #4
	BEQ _CSC5

	@Case 5 is CIS1A
	CMP R1, #5
	BEQ _CIS1A
	BGT _zero

	@Default is 0
	CMP R1, #0
	BEQ _zero

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
