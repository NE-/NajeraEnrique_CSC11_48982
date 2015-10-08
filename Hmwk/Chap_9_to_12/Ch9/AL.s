/*
	File:    AL.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 91
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #10
	MOV R2, #15

	ADDAL R0, R1, R2
	ADD R0, R1, R2
_exit:
	MOV R7, #1
	SWI 0

