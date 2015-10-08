/*
	File:    LS.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 92
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #1
	MOV R1, #5

	CMP R0, R1
	ADDLS R0, R0, #1
_exit:
	MOV R7, #1
	SWI 0

