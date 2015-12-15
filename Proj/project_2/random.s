/*
  File:    random.s
  Author:  Enrique Najera
  Purpose: CSC 11 Project 2
           Generates random number
  18 December 2015
 */

.data

.balign 4
debugMsg: .asciz "RAND: %d\n"

.text

    .global random
random:
    /* Generate random number */
    PUSH {R4, LR}

    MOV R0, #0
	BL time
	BL srand

	MOV R4, #0
	MOV R5, #1 @Get 1-6

/* rand() % 6 + 1 */
loop_rand:
    BL rand
	MOV R1, R0, ASR #1
	MOV R2, #6

	BL divMod
	ADD R1, R5

/*	LDR R0, address_of_debugMsg
	BL printf*/

	ADD R4, #1
	CMP R4, #1 @only get one random number
	BLT loop_rand

    B gOut
	POP {R4, LR}
	BX LR

divMod:
    PUSH {LR}

	MOV R0, #0
	MOV R3, #1
	CMP R1, R2
	BLT end
	BL scaleLeft
	BL addSub

	end:
	    POP {LR}
		BX LR

scaleLeft:
    PUSH {LR}
	doWhile_R1_GE_R2:
		MOV R3, R3, LSL #1
		MOV R2, R2, LSL #1
		CMP R1, R2
	BGE doWhile_R1_GE_R2
	MOV R3, R3, ASR #1
	MOV R2, R2, ASR #1
	POP {LR}
	BX LR

addSub:
    PUSH {LR}
	doWhile_R3_GE_1:
	    ADD R0, R0, R3
		SUB R1, R1, R2
		BL scaleRight
	CMP R3, #1
	BGE doWhile_R3_GE_1

	POP {LR}
	BX LR

scaleRight:
    PUSH {LR}

	doWhile_R1_LT_R2:
	    MOV R3, R3, ASR #1
		MOV R2, R2, ASR #1
	CMP R1, R2
	BLT doWhile_R1_LT_R2

	POP {LR}
	BX LR

/* References */
address_of_debugMsg: .word debugMsg

/* Extern */
.global printf
.global time
.global srand
.global rand
.global menu

