/*
	File:    DivModShift.s
	Author:  Enrique Najera
	Purpose: 1) Shift left until denominator is just less than the numerator
	         2) Subtract denominator from shifted numerator, increment the shifted division
	         3)  Shift the denominator right until just less than what is left from the numerator after subtraction
	         4) Repeat 2) until the increment for the shifted division is no more than 1
	         5) Output the results, either div or mod.
*/

	.global _start
_start:
	MOV R1, #45 @Numerator
	MOV R2,  #6 @Denominator
	MOV R3,  #1 @Scale
	MOV R4,  #6 @Original
	MOV R5,  #4 @Scale
