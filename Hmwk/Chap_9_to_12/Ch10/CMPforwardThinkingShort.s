/*
	File:    CMPforwardThinkingShort.s
	Author:  Enrique Najera
	Purpose: Chapter 10 concepts page 97
 */

	.global _start
_start:
	MOV R0, #100
	MOV R1, #20

loop:
	CMP R0, R1
	SUBGT R0, R0, R1
	SUBLT R1, R1, R0
	BNE loop

_exit:
	MOV R7, #1
	SWI 0

