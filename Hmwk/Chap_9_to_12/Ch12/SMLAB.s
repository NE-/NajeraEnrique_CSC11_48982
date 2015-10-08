/*
	File:    SMLAB.s
	Author:  Enrique Najera
	Purpose: Chapter 12 concepts page 109
 */

	.global _start
_start:
	MOV R0, #0
	MOV R5, #2
	MOV R6, #3
	MOV R7, #4

	SMLAB R0, R5, R6, R7

_exit:
	MOV R7, #1
	SWI 0

