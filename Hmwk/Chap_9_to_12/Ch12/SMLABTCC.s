/*
	File:    SMLABTCC.s
	Author:  Enrique Najera
	Purpose: Chapter 12 concepts page 111
 */

	.global _start
_start:
	MOV R0, #0
	MOV R1, #1
	MOV R2, #2
	MOV R3, #3

	SMLABTCC R0, R1, R2, R3

_exit:
	MOV R7, #1
	SWI 0

