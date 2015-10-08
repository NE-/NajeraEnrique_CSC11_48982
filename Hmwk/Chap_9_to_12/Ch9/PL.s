/*
	File: PL.s
	Author: Enrique Najera
	Purpose: Chapter 9 concept page 90
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #5

	SUBS R1, R1, #1
	ADDMI R0, R0, #15
	ADDPL R0, R0, #255
_exit:
	MOV R7, #1
	SWI 0

