/*
 * File: random.s
 * Author: Copied from class example
 * Purpose: Generate random number
 * 06 November 2015
 */

.data

.balign 4
message: .asciz "_%d_"
winMsg:  .asciz "WIN!!"
loseMsg: .asciz "LOSE!!"

.text

.global random
random:
    PUSH {R4, LR}

	MOV R0, #0
	BL time
	BL srand

	MOV R4, #0
	MOV R5, #4 @Get multiples of 4

/* rand() % 8 * 4 */
loop_rand:
    BL rand
	MOV R1, R0, ASR #1
	MOV R2, #8

	BL divMod
	MUL R1, R5

	LDR R0, address_of_message
	BL printf

	ADD R4, #1
	CMP R4, #3
	BLT loop_rand

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
	    ADD R0, R0 , R3
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

win:
    /* Output win */
	LDR R0, address_of_winMsg
	BL printf

	/* Multiply by 2,3,or 4 */
	CMP R0, #1
	BEQ _2x
	CMP R0, #2
	BEQ _3x
	CMP R0, #3
	BEQ _4x
	BGT lose

	_2x:
	    MOV R1, R1, LSL #1
	_3x:
	    MOV R1, R1, LSL #2
	_4x:
	    MOV R1, R1, LSL #3

	BX LR

lose:
    LDR R0, address_of_loseMsg
	BL printf

	/* Subtract coinIn from coinAmount */
	BX LR

/* References */
address_of_message: .word message
address_of_winMsg:  .word winMsg
address_of_loseMsg: .word loseMsg

/* External */
.global printf
.global time
.global srand
.global rand
