/*
 * File:    spin.s
 * Author:  Enrique Najera
 * Purpose: CSC11 Project
 *          Maths for spinning machine
 * 06 November 2015
 */

.data

.balign 4
spinMsg: .asciz "\nSPINNED\n"
escape:  .asciz "\n"

.balign 4
spinOut: .asciz "_%d_%d_%d\n"

.balign 4
slots: .word 1,2,3,4,5,6,7

.text

	.global spin
	.global printSpin
spin:
    /* Prompt for coins */
    BL player
	/* Print spin message */
	LDR R0, address_of_spinMsg
	BL printf

    /* Spin */
	LDR R1, address_of_slots
	LDR R2, address_of_slots
	LDR R3, address_of_slots

printSpin:
    /* Convert numbers */
	//MOVS R4, R4, LSL #1
	/* Output spin */
	/*LDR R0, address_of_spinOut
	LDR R1, [R1, +#0]
	LDR R2, [R2, +#4]
	LDR R3, [R3, +#24]
	BL printf*/
	BL random

	LDR R0, address_of_escape
	BL printf

	BAL game_loop

/* References */
address_of_spinMsg: .word spinMsg
address_of_spinOut: .word spinOut
address_of_slots:   .word slots
address_of_escape:  .word escape

/* Extern */
.global printf
.global player
.global game_loop
.global random

