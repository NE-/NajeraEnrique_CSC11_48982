/*
  File: wallet.s
  Author: Enrique Najera
  Purpose: CSC 11 Project 2
           Holds wallet amount as float
  16 December 2015
 */

.data

/* Messages */
.balign 4
walletMsg: .asciz "Wallet: %.2f\n"

/* Declare Variables */
.balign 4
walletAmt: .float 50.0

    .global wallet
wallet:
    LDR R1, address_of_walletAmt
	VLDR S14, [R1]
	VCVT.F64.F32 D5, S14

	LDR R0, =walletMsg
	VMOV R2, R3, D5
	BL printf

	B menuOut

/* References */
address_of_walletAmt: .word walletAmt

/* Extern */
.global printf
.global menuOut

