/*
	File:    GE.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 93
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #5

	CMP R0, R1
	ADDGE R0, R0, #255
_exit:
	MOV R7, #1
	SWI 0

