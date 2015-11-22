/*
 * File:    blink.s
 * Author:  Enrique Najera
 * Purpose: Turn on LED using GPIO 
 *          in assembly
 * 30 November 2015
 */

.data

.balign 4
intro:  .asciz "Raspberry Pi wiringPi blink test\n"
errMsg: .asciz "Setup didn't work... Aborting...\n"
pin:     .int 7
i:       .int 0
delayMs: .int 250
OUTPUT = 1

.text

    .global main

    /* Extern */
    .extern printf
    .extern wiringPiSetup
    .extern delay
    .extern digitalWrite
    .extern pinMode

main:
    PUSH {IP, LR} @Return address + dummy reg

	/* printf(intro) */
	LDR  R0, =intro
	BL printf

	/* if (wiringPiSetup() == -1)
	       printf(errMsg)
		   exit(1)
	*/
	BL wiringPiSetup
	MOV R1, #-1
	CMP R0, R1
	BNE init
	LDR R0, =errMsg
	BL printf
	B done

	/* pinMode(pin, OUTPUT) */
init:
    LDR R0, =pin
	LDR R0, [R0]
	MOV R1, #OUTPUT
	BL pinMode

	/* for (i = 0; i < 10; i++) */
	LDR R4, =i
	LDR R4, [R4]
	MOV R5, #10

forLoop:
    CMP R4, R5
	BGT done

	/* digitalWrite (pin, 1) */
	LDR R0, =pin
	LDR R0, [R0]
	MOV R1, #1
	BL digitalWrite

	/* delay(250) */
	LDR R0, =delayMs
	LDR R0, [R0]
	BL delay

	/* digitalWrite(pin, 0) */
	LDR R0, =pin
	LDR R0, [R0]
	MOV R1, #0
	BL digitalWrite

	/* delay(250) */
	LDR R0, =delayMs
	LDR R0, [R0]
	BL delay

	ADD R4, #1
	B forLoop

done:
    POP {IP, PC} @Return address into PC

