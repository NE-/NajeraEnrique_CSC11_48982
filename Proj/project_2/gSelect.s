/*
  File: gSelect.s
  Author: Enrique Najera
  Purpose: CSC 11 Project 2
           Creates gambler's selection
 */

.data

/* Messages */
.balign 4
gamblerMsg: .asciz "\n Gambler says %d\n"
multMsg:    .asciz "Bet multiplied by: %d\n"

/* Declare Variables */
.balign 4
gArry:     .word 1,2,3,4,5,6
selection: .word 0

.text

    .global gSelect
	.global gOut
	.global dieCheck
gSelect:
    PUSH {R4, LR}

    B random

gOut:
    // Hold selection in static reg
    MOV R6, R1
	// Print selection
    LDR R0, address_of_gamblerMsg
	BL printf

    MOV R2, #0 @Counter for multiplying
	MOV R3, #0 @counter for 3.14
	MOV R4, #0 @Loop counter

	B die

	// INIT dice
	die:
	    ADD R4, R4, #1
		CMP R4, #4
		BEQ mult
	        B randomDie

	dieCheck:
	    /* Check for 3 1 4 */
	    CMP R1, #3
		    ADDEQ R3, R3, #1
		CMP R1, #1
		    ADDEQ R3, R3, #1
		CMP R1, #4
		    ADDEQ R3, R3, #1
        /* Check for gambler's integer */
		CMP R1, R6
		BNE die
		    ADD R2, R2, #1

    mult:
	    B menu
	 /*   LDR R0, address_of_multMsg
		MOV R1, R2
		BL printf*/

		// If rolls dont match, wallet -= bet

		// If player got 3 1 4


/* References */
address_of_gamblerMsg: .word gamblerMsg
address_of_gArry:      .word gArry
address_of_selection:  .word selection
address_of_multMsg:    .word multMsg

/* Extern */
.global menu
.global printf
.global randomDie

