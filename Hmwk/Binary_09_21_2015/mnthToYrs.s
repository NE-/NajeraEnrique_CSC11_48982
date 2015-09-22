/*
	File:    mnthToYrs.s
	Author:  Enrique Najera
	Purpose: Convert months to years
	21 September 2015
*/

	.global _start
_start:
	MOV R1, #88       @BP  0 WD  8
	LDR R2, =0x155556 @BP -4 WD 24
	MUL R0, R2, R1    @BP -4 WD 32
	LSR R0, #24       @BP  0 WD  8

	@SYS_EXIT
	MOV R7, #1
	SWI 0

