/* File: player.s
 * Author: Enrique Najera
 * Purpose: CSC11 Project
 *          Holds player info
 * 06 November 2015
 */

.data

.balign 4
coinAmount: .word 100

.balign
coinIn: .word 0

.balign 4
coinPrompt: .asciz "Enter coins: "

.balign 4
coinTTL: .asciz "Total coins: %d\n"

.balign 4
scan_pattern_coin: .asciz "%d"

.balign 4
return: .word 0

	.global player
player:
	LDR R1, address_of_return
	STR LR, [R1]

    CMP R3, #1
	BGT outputCoin
	MOV R3, #100

    outputCoin:
    /* Output total coins */
	LDR R0, address_of_coinTTL
	LDR R1, address_of_coinAmount
	LDR R1, [R1]
	BL printf

	/* Prompt for coin input */
	LDR R0, address_of_coinPrompt
	BL printf

    /* Get coin input */
	LDR R0, address_of_scan_pattern_coin
    LDR R1, address_of_coinIn
	BL scanf

	LDR R2, address_of_coinAmount
	LDR R2, [R2]

	SUBS R2, R2, R1

//	SUBS R2, R2, R1

    /* Output coin amount */
	LDR R0, address_of_coinTTL
	LDR R1, address_of_coinAmount
	LDR R1, [R1]
	BL printf

	LDR LR, address_of_return
	LDR LR, [LR]
	BX LR
address_of_coinAmount: .word coinAmount
address_of_coinIn: .word coinIn
address_of_coinPrompt: .word coinPrompt
address_of_coinTTL: .word coinTTL
address_of_scan_pattern_coin: .word scan_pattern_coin
address_of_return: .word return

.global printf
.global scanf
