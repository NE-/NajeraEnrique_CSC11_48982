/*
	File:    CMPforwardThinking.s
	Author:  Enrique Najera
	Purpose: Chapter 10 concepts page 97
 */

	.global _start
_start:
	MOV R0, #100
	MOV R1, #20

loop:
	CMP R0, R1
	BEQ stop
	BLT less
	SUB R0, R0, #1
	BAL loop

less:
	SUB R1, R1, R0
	BAL loop

stop:
	MOV R7, #1
	SWI 0

