/*
	File:    EQ.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 89
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #0

	MOVS R0, R1
	MOVEQ R0, #1
_exit:
	MOV R7, #1
	SWI 0

