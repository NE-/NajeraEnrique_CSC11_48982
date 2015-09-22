/* 
	File:    3.s
	Author:  Enrique Najera
	Purpose: Convert area to radius^2  area->2 Byte, 
	         conversion->2 Bytes, 
			 Result->1 Byte then output radius^2
			 area = 113.4
	23 September 2015
 */

	.global _start
_start:
	LDR R1, =0x716    @BP  -1 WD  6 AREA
	LDR R2, =0x243F6A @BP -20 WD 24 CONST PI
	MUL R0, R2, R1    @BP -20 WD 30
	LSR R0, #19       @BP   0 WD  6 

	@SYS_EXIT
	MOV R7, #1
	SWI 0

