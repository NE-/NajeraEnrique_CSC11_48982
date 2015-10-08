/*
	File:    RRX.s
	Author:  Enrique Najera
	Purpose: Chapter 11 concepts page 105
 */

	.global _start
_start:
	MOV R1, #0xF000000F
	MOV R0, R1, RRX

_exit:
	MOV R7, #1
	SWI 0

