/*
 * File: assignmentArrayFib.s
 * Author: Enrique Najera
 * Purpose: Fibonacci sequence using arrays
 * 11 November 2015
 */

.data

/* Prompt message */
.balign 4
promptMsg:    .asciz "Type a term: "
outMsg:       .asciz "Fibonacci number: %d\n"
ovrflwMsg:    .asciz "0\n"
scan_pattern: .asciz "%d"

/* Variables */
.balign 4
number_read:  .word 0
.balign 4
fibAry: .skip 180
.balign 4
return: .word 0

.text

.global main
main:
    LDR R1, address_of_return
	STR LR, [R1]

    /* Prompt for term */
    LDR R0, address_of_promptMsg
	BL printf

    /* Get user input */
	LDR R0, address_of_scan_pattern
    LDR R1, address_of_number_read
	BL scanf

    LDR R0, address_of_number_read
	LDR R0, [R0]
    
	/* If inpput > 45, output 0 */
	CMP R0, #44
	BGT overflow
	/* If input < 46 initialize variables */
	LDR R1, address_of_fibAry @Array
	MOV R5, #1 @start
	MOV R4, #0 @next
	MOV R6, #0 @last
	BL fillAry

fillAry:
    CMP R2, R0
	BGT outTerm
	    ADD R4, R5, R6
	    MOV R5, R6
	    MOV R6, R4
        ADD R3, R1, R2, LSL #2
	STR R6, [R3] 
	ADD R2, R2, #1
	B fillAry
outTerm:
    /* Load number inserted */
    LDR R2, address_of_number_read
	LDR R2, [R2]
	MOV R1, R2
	/* Multiply number by 4 */
	ADD R2, R2, R2, LSL #1
	ADD R2, R1
	/* Subtract 4 since array starts at 0 */
	//SUB R2, R2, #4

    /* Print sequence */
    LDR R0, address_of_outMsg
	LDR R1, address_of_fibAry
	LDR R1, [R1, R2]
	BL printf 

	BAL end
overflow:
	LDR R0, address_of_ovrflwMsg
	BL printf
	BAL end
end:
    LDR R1, address_of_return
	LDR LR, [R1]
    BX LR

/* References */
address_of_fibAry:       .word fibAry
address_of_return:       .word return
address_of_promptMsg:    .word promptMsg
address_of_scan_pattern: .word scan_pattern
address_of_number_read:  .word number_read
address_of_outMsg:       .word outMsg
address_of_ovrflwMsg:    .word ovrflwMsg

/* Extern */
.global printf
.global scanf

