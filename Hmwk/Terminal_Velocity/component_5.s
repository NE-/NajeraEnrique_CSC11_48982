/*
 * File: component_5.s
 * Author: Enrique Najera
 * Purpose: Scaled integer in assembly
 * 07 December 2015
 */

.data

outVt: .asciz "Velocity = %d ft/sec\n"
outDP: .asciz "Dynamic Pressure = %d lb/ft^2\n"

.balign 4
return: .word 0

.text

.global main
main:
    LDR R1, address_of_return
	STR LR, [R1]

	// INIT Registers
	LDR R0, =0x504816EE @Diameter^2           BP-36 WD32
	LDR R1, =0x19EB851E @Weight               BP-32 WD32
	LDR R2, =0x8        @2Coefficient of Drag BP-04 WD01
	LDR R3, =0x9B2EC51  @Density of Air       BP-36 WD28
	LDR R4, =0x3243F6A9 @Pi                   BP-28 WD32
	MOV R5, #0          @Place holder

	// Finding Vt
	LSR R4, #16    @BP-12 WD16
	LSR R3, #12    @BP-24 WD16
	MUL R5, R4, R3 @BP-36 WD32

	LSR R5, #16    @BP-20 WD16
	LSR R0, #16    @BP-20 WD16

	MUL R5, R0, R5 @BP-40 WD32
	LSR R5, #12    @BP-28 WD16

	MOV R0, R5 @BP-28 WD16

	B _divMod

_divMod:
    // R0 Denominator
	// R1 Numerator
	MOV R2, #1 // Increment
	MOV R3, R1 // Holds mod
	MOV R4, #0 // Holds quotient

	_while_R1_GT_R0:
	    LSL R0, #1
		LSL R2, #1
	CMP R1, R0
	BGT _while_R1_GT_R0
	LSR R0, #1
	LSR R2, #1

	_while_R1_GTE_R0:
	    CMP R1, R0
		BLT _sqrt
		    ADD R4, R4, R2
			SUB R1, R1, R0

			_while_R2_GT_1:
			    CMP R2, #1
			    BLE _while_R1_GTE_R0
			        LSR R2, #1
				    LSR R0, #1
                BAL _while_R2_GT_1
	        BAL _while_R1_GTE_R0

	_sqrt:
	    MOV R1, R4 // S
		MOV R0, R1 // Xn
		LSR R0, #1 // X0
		MOV R3, #0
		MOV R2, R0

		_while_R0_DNE_R3:
		    CMP R0, R3
			BEQ _outputVt
			    MOV R0, R2 // Xn = temp
				MOV R1, R4 // INIT S
				MOV R3, #0 // Holds quotient

				// S / Xn
				B _div_check

				_div:
				    ADD R3, R3, #1
					SUB R1, R1, R0
				_div_check:
				    CMP R1, R0
					BGE _div

				// (S / Xn) + Xn
				ADD R3, R3, R0
                
				// Divide by 2
				LSR R3, #1
				MOV R2, R3 // Temp = Xn + 1

			BAL _while_R0_DNE_R3

    _outputVt:
	    MOV R1, R0
		LDR R0, address_of_outVt
		BL printf

	// INIT Registers
	MOV R0, #0 // q
	LDR R1, =0x9B2EC51 // Density of Air BP-36 WD28
	LSR R1, #12        @BP-24 WD16
	MUL R4, R1, R4     // (Vt^2 * p)
	MOV R0, R4
	LSR R0, #1         // Divide by 2
	LSR R0, #24        @BP 0 WD08
	B _outputDP

	_outputDP:
	    MOV R1, R0
		LDR R0, address_of_outDP
		BL printf
 
        // SYS_EXIT
		LDR R1, address_of_return
		LDR LR, [R1]
		BX LR

address_of_outVt:  .word outVt
address_of_outDP:  .word outDP
address_of_return: .word return

/* Extern */
.global printf

