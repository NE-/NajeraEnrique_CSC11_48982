/*
 * File:    main.s
 * Author:  Enrique Najera
 * Purpose: CSC11 Project
 *          Slots game main container
 * 06 November 2015
 */

.data

.balign 4
prompt: .asciz "Type 1 to spin\n2 to exit\n3 for help\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
number_read: .word 0

.balign 4
return: .word 0

.text

	.global main
	.global game_loop
main:
	LDR R1, address_of_return
	STR LR, [R1]

	game_loop:

        /* Prompt for spin, help, or exit */
	    LDR R0, address_of_prompt
	    BL printf

	    /* Get user input */
	    LDR R0, address_of_scan_pattern
	    LDR R1, address_of_number_read
	    BL scanf
        
		/* Store input in R0 for checking */
	    LDR R0, address_of_number_read
	    LDR R0, [R0]

		/* Check user input */
	    CMP R0, #1
	    BEQ spin

	    CMP R0, #2
	    BEQ exit

	    CMP R0, #3
	    BEQ help

		BL game_loop

exit:
	LDR R1, address_of_return
	LDR LR, [R1]
	BX LR

/* References */
address_of_prompt:        .word prompt
address_of_scan_pattern: .word scan_pattern
address_of_number_read:  .word number_read
address_of_return:       .word return

/* External */
.global printf
.global scanf

