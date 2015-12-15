/*
  File: errorMsgs.s
  Author: Enrique Najera
  Purpose: CSC 11 Project 2
           Holds all error messages
  16 December 2015
 */

.data

/* Messages */
.balign 4
error_betExceedsMsg: .asciz "Bet more than wallet!!\n"
error_outOfMoneyMsg: .asciz "\nOut of money!!!\n"

.text

    .global errorMsgs
	.global error_betExceeds
	.global error_outOfMoney
errorMsgs:
    error_betExceeds:
	    LDR R0, address_of_error_betExceedsMsg
		BL printf

		B menu

	error_outOfMoney:
	    LDR R0, address_of_error_outOfMoneyMsg
		BL printf 
		B menu
    
/* References */
address_of_error_betExceedsMsg: .word error_betExceedsMsg
address_of_error_outOfMoneyMsg: .word error_outOfMoneyMsg

/* Extern */
.global menu

