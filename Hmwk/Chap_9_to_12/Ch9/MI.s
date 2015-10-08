/*
	File:    MI.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 90
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #0
	MOV R1, #0

	SUBS R1, R1, #1
	ADDMI R0, R0, #15
_exit:
	MOV R7, #1
	SWI 0

