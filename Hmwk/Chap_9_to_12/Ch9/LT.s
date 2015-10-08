/*
	File:    LT.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 93
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #3

	CMP R0, #255
	SUBLT R0, R0, R1
_exit:
	MOV R7, #1
	SWI 0

