/*
	File:    HI.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 92
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #10
	MOV R1, #5

	CMP R0, R1
	MOVHI R0, #0
_exit:
	MOV R7, #1
	SWI 0

