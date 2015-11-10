/*
 * File:    assignment9.s
 * Author:  Enrique Najera
 * Purpose: Recursive Fibonacci with PUSH and POP
 * 09 November 2015
 */

.data

message1: .asciz "Type a term: "
message2: .asciz "The Fibonacci number of %d is %d\n"
format: .asciz "%d"

.text

fibonacci:
    PUSH {R4, LR}

	MOV R4, R0

	CMP R0, #1
	BNE fibRecursive
	MOV R0, #1
	B end

fibRecursive:
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

	LDR R0, address_of_message1
	BL printf

	LDR R0, address_of_format
	MOV R1, SP

	BL scanf

	LDR R0, [SP]

	BL fibonacci

	MOV R2, R0

	LDR R1, [SP]

	LDR R0, address_of_message2
	BL printf

	ADD SP, SP, #+4
	LDR LR, [SP], #+4
	BX LR

address_of_message1: .word message1
address_of_message2: .word message2
address_of_format:   .word format

