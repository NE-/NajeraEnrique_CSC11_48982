/*
	File:    NE.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 89
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #10

	CMP R0, R1
	ADDNE R0, R0, R1
_exit:
	MOV R7, #1
	SWI 0

