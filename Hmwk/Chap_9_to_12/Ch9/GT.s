/*
	File:    GT.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 93
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #10
	MOV R1, #5
	MOV R2, #3

	CMP R0, R1
	ADDGT R0, R1, R2
_exit:
	MOV R7, #1
	SWI 0

