/* 
	File:    5.s
	Author:  Enrique Najera
	Purpose: Calculate area given the radius  radius->2 Byte, 
	         conversion->2 Bytes, 
			 Result->1 Byte then output area
			 radius=6.5
	23 September 2015
 */

	.global _start
_start:
	LDR R1, =0x68     @BP  -1 WD  4 RADIUS
	LDR R2, =0x243F6A @BP -20 WD 24 CONST PI
	MUL R3, R1, R1    @Square radius
	MUL R0, R2, R1    @BP -20 WD 28
	LSR R0, #2        @BP   0 WD  8 

	@SYS_EXIT
	MOV R7, #1
	SWI 0

