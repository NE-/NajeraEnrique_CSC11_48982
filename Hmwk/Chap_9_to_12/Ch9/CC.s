/*
	File:    CC.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 91
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #0
	MOV R1, #0

	ADDS R0, R0, #255
	ADDCS R1, R1, #15
	ADDCC R1, R1, #128
_exit:
	MOV R7, #1
	SWI 0

