/* 
	File:    2.s
	Author:  Enrique Najera
	Purpose: Convert area to radius^2  
	         area->1 Byte, 
			 conversion->3 Bytes, 
			 Result->1 Byte then output radius^2
			 area = 110
	23 September 2015
 */

	.global _start
_start:
	MOV R1, #110      @BP   0 WD  7 AREA
	LDR R2, =0x243F6A @BP -20 WD 24 CONST PI
	MUL R0, R2, R1    @BP -20 WD 32
	LSR R0, #23       @BP   0 WD  7 

	@SYS_EXIT
	MOV R7, #1
	SWI 0

