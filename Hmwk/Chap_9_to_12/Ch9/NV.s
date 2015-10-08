/*
	File:    NV.s
	Author:  Enrique Najera
	Purpose: Chapter 9 concept page 92
	07 October 2015
 */

	.global _start
_start:
	MOV R0, #5
	MOV R1, #10
	MOV R2, #15

	ADDNV R0, R1, R2
	ADD R0, R0, #1

_exit:
	MOV R7, #1
	SWI 0

