/* 
 * File: random.s
 * Author: Enrique Najera
 * Purpose: CSC11 Project
 *          PRNG for slots
 * 06 November 2015
 */

.text

    .global random
random:
    CMP R4, #0
	BGT shift_left
	init:
        MOV R4, #1
	    MOV R5, #0
	    MOV R6, #8
	    MOV R7, #2

	shift_left:
	    MOVS R4, R4, LSL R7
		ADD R5, R5, #4
		SUB R6, R6, #4
		CMP R4, #24
		BGT init

	BAL printSpin

/* Extern */
.global printSpin

