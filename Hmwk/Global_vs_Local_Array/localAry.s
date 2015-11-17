/*
 * File:    localAry.s
 * Author:  Enrique Najera
 * Purpose: Implement Fibonacci using stack
 * 18 November 2015
 */

.data

/* Messages */
.balign 4
message1: .asciz "Type a term: "
message2: .asciz "The Fibonacci number of %d is %d\n"
messageO: .asciz "0\n"
format: .asciz "%d"

.text

/* If input > 46 output 0 */
overflow:
    LDR R0, address_of_messageO
	BL printf
	BAL end

fibonacci:
    PUSH {R4, LR}

	MOV R4, R0

	CMP R0, #1
	BNE fibStack
	MOV R0, #1
	B end

fibStack:
	SUB R0, R0, #1
	BL fibonacci

	MOV R1, R4
	ADD R0, R5, R3
	MOV R5, R3
	MOV R3, R0
end:
    POP {R4, LR}
	BX LR

.global main
main:
    STR LR, [SP, #-4]!
	SUB SP, SP, #4

	MOV R2, #1 @Counter

    /* Prompt for term */
	LDR R0, address_of_message1
	BL printf

    /* Get user input */
	LDR R0, address_of_format
	MOV R1, SP
	BL scanf

	LDR R0, [SP]
	
    /* If input > 46, output 0 */
	CMP R0, #46
	BGT overflow
	BL fibonacci

	MOV R2, R0
	LDR R1, [SP]

    /* Output result */
	LDR R0, address_of_message2
	BL printf

	ADD SP, SP, #+4
	LDR LR, [SP], #+4
	BX LR

address_of_message1: .word message1
address_of_message2: .word message2
address_of_messageO: .word messageO
address_of_format:   .word format

