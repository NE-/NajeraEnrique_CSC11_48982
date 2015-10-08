/*
	File:    decrementCMP.s
    Author:  Enrique Najera
    Purpose: Chapter 10 concepts page 97
    07 October 2015
 */

	.global _start
_start:
	MOV R0, #50

loop:
    SUBS R0, R0, #1
	BNE loop

_exit:
	MOV R7, #1
	SWI 0

