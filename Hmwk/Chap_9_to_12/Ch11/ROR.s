/*
	File:    ROR.s
	Author:  Enrique Najera
	Purpose: Chapter 11 concepts page 104
 */

	.global _start
_start:
	MOV R1, #0xF000000F
	MOVS R0, R1, ROR #4

_exit:
	MOV R7, #1
	SWI 0

