/*
	File:    LSL.s
	Author:  Enrique Najera
	Purpose: Chapter 11 concepts page 102
 */

	.global _start
_start:
	MOV R1, #17
	MOVS R0, R1, LSL #1

_exit:
	MOV R7, #1
	SWI 0

