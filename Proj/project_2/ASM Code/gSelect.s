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
betMsg:     .asciz "Place your bet: "
rollMsg:    .asciz "\nSPINNED %d\n"
multMsg:    .asciz "Bet multiplied by: %d\n"
piMsg:      .asciz "\n GOT EXTRA $3.14!!!\n"

scan:       .asciz "%d"

/* Declare Variables */
.balign 4
bet:       .word 0
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

	// Prompt for bet
	LDR R0, address_of_betMsg
	BL printf

	LDR R0, address_of_scan
	LDR R1, address_of_bet
	BL scanf

    /* Store bet in R0 for checking */
	LDR R2, address_of_bet
	LDR R2, [R2]

	CMP R2, #50
	BGT error_betExceeds

    /* INIT vars */
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

	    /* MAKES PROGRAM SLOOOOOW    
		LDR R0, address_of_rollMsg
		BL printf
		 If rolls dont match, wallet -= bet
		
        CMP R3, #0
		    VMOV R0, R1, D5
			VSUB.F64 D5, D0, D5*/

		// If player got 3 1 4
		CMP R3, #3
		BNE menu
		    LDR R0, address_of_piMsg
			BL printf

			LDR R0, =0x3243F6A9 @Pi BP-32 WD32
			LSR R0, #28         @   BP-04 WD04
			//VADD.F64 D5, D5, R0

        B menu

/* References */
address_of_gamblerMsg: .word gamblerMsg
address_of_betMsg:     .word betMsg
address_of_rollMsg:    .word rollMsg
address_of_piMsg:      .word piMsg
address_of_gArry:      .word gArry
address_of_selection:  .word selection
address_of_multMsg:    .word multMsg
address_of_bet:        .word bet
address_of_scan:       .word scan

/* Extern */
.global menu
.global printf
.global randomDie
.global error_betExceeds

