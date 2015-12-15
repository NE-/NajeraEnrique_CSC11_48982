/*
  File:    main.s
  Author:  Enrique Najera
  Purpose: CSC 11 Project 2
           Main menu
 */

.data

/* Messages */
.balign 4
msgPrompt:  .asciz "____CROWN AND ANCHOR____\n1) Roll\n2) Help\n3) Exit\n"
msgNoMoney: .asciz "\nOut of money!!!\n"
msgExit: .asciz "\nGOODBYE!\n"

/* Variables */
.balign 4
choice: .word 0
format: .asciz "%d"

.text

    .global main
	.global menu
	.global menuOut
main:
    PUSH {R4, LR}

menu:
    // Display wallet
    B wallet
menuOut:
    // Display choices 
    LDR R0, address_of_msgPrompt
	BL printf

	// Get choice
	LDR R0, address_of_format
	LDR R1, address_of_choice
	BL scanf

	// Store number for comparing
	LDR R1, address_of_choice
	LDR R1, [R1]

    // Roll
	CMP R1, #1
	BEQ gSelect
	BLT exit

	// Help/About menu
	CMP R1, #2
	BEQ help
	BGT exit

	BAL menu

exit:
    // SYS_EXIT
	POP {R4, LR}
	BX LR

/* References */
address_of_msgPrompt:  .word msgPrompt
address_of_msgNoMoney: .word msgNoMoney
address_of_msgExit:    .word msgExit

address_of_choice:     .word choice
address_of_format:     .word format

/* Extern */
.global printf
.global scanf

