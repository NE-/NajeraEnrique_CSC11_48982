/* 
	File:    4.s
	Author:  Enrique Najera
	Purpose: Calculate area given the radius  radius->1 Byte, 
	         conversion->3 Bytes, 
			 Result->1 Byte then output area
	         radius=6 
	23 September 2015
 */

	.global _start
_start:
	MOV R1, #6        @BP   0 WD  3 RADIUS
	LDR R2, =0x243F6A @BP -20 WD 24 CONST PI
	MUL R3, R1, R1    @Square radius
	MUL R0, R2, R1    @BP -20 WD 27
	LSR R0, #3        @BP   0 WD  8 

	@SYS_EXIT
	MOV R7, #1
	SWI 0

