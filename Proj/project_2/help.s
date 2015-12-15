/*
  File:    roll.s
  Author:  Enrique Najera
  Purpose: CSC 11 Project 2
           Holds roll properties
  18 December 2015
*/

.data

/* Messages by line for readability*/
/**ABOUT            */
.balign 4
aboutMsgL1: .asciz "_____________ABOUT______________\n"
aboutMsgL2: .asciz "--------CROWN AND ANCHOR--------\n"
aboutMsgL3: .asciz "________________________________\n"
aboutMsgL4: .asciz "The gambler selects an integer\n"
aboutMsgL5: .asciz "from 1 to 6, and then three dice\n"
aboutMsgL6: .asciz "are rolled. If exactly x dice show\n"
aboutMsgL7: .asciz "the gambler's number, the payoff is\n"
aboutMsgL8: .asciz "x to 1.\nElse, lose your bet\n"
aboutMsgL9: .asciz "SPIN 3 1 4 FOR A FREE $3.14!!\n"

/**HOW TO PLAY      */
.balign 4
howToMsgL1: .asciz "\n________HOW TO PLAY___________\n"
howToMsgL2: .asciz "After choosing to roll, the gambler\n"
howToMsgL3: .asciz "will say their integer then you\n"
howToMsgL4: .asciz "place your bet and hit Return/Enter.\n"

.text

    .global help
help:
    // Print ABOUT
    LDR R0, address_of_aboutMsgL1
	BL printf
	LDR R0, address_of_aboutMsgL2
	BL printf
	LDR R0, address_of_aboutMsgL3
	BL printf
	LDR R0, address_of_aboutMsgL4
	BL printf
	LDR R0, address_of_aboutMsgL5
	BL printf
	LDR R0, address_of_aboutMsgL6
	BL printf
	LDR R0, address_of_aboutMsgL7
	BL printf
	LDR R0, address_of_aboutMsgL8
	BL printf
	LDR R0, address_of_aboutMsgL9
	BL printf

	// Print HOW TO PLAY
	LDR R0, address_of_howToMsgL1
	BL printf
    LDR R0, address_of_howToMsgL2
	BL printf
    LDR R0, address_of_howToMsgL3
	BL printf
    LDR R0, address_of_howToMsgL4
	BL printf

	B menu

/* References */
/**ABOUT */
address_of_aboutMsgL1: .word aboutMsgL1
address_of_aboutMsgL2: .word aboutMsgL2
address_of_aboutMsgL3: .word aboutMsgL3
address_of_aboutMsgL4: .word aboutMsgL4
address_of_aboutMsgL5: .word aboutMsgL5
address_of_aboutMsgL6: .word aboutMsgL6
address_of_aboutMsgL7: .word aboutMsgL7
address_of_aboutMsgL8: .word aboutMsgL8
address_of_aboutMsgL9: .word aboutMsgL9


/**HOW TO PLAY */
address_of_howToMsgL1: .word howToMsgL1
address_of_howToMsgL2: .word howToMsgL2
address_of_howToMsgL3: .word howToMsgL3
address_of_howToMsgL4: .word howToMsgL4

/* Extern */
.global printf
.global menu
