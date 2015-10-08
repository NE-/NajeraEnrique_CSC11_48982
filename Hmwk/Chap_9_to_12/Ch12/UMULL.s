/*
	File:    UMULL.s
	Author:  Enrique Najera
	Purpose: Chapter 12 concepts page 109
 */

	.global _start
_start:
	MOV R1, #1
	MOV R2, #2
	MOV R3, #3
	MOV R4, #4

	UMULL R3, R4, R1, R1

_exit:
	MOV R7, #1
	SWI 0

