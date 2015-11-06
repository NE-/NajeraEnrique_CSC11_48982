/*
 * File:    help.s
 * Author:  Enrique Najera
 * Purpose: CSC11 Project
 *          Displays rules and info of game
 * 06 November 2015
 */

.data

.balign 4
debug: .asciz "ASSEMBLY SLOTS\nGet same numbers in a row (e.g 1_1_1, 2_2_2, 3_3_3...)\n1-4 DOUBLE money\n5-6 TRIPLE money\n7 4X MONEY!!\n"

.text

	.global help
help:
	LDR R0, address_of_debug
	BL printf

	BAL game_loop

address_of_debug: .word debug

.global printf
.global game_loop
