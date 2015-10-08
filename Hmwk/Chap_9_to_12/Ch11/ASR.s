/*
	File:    ASR.s
	Author:  Enrique Najera
	Purpose: Chapter 11 concepts page 104
 */

	.global _start
_start:
	MOV R1, #255
	MOV R2, #1

	MOVS R0, R1, ASR R2

_exit:
	MOV R7, #1
	SWI 0

