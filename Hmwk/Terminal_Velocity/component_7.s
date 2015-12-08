/*
 * File: component_7.s
 * Author: Enrique Najera
 * Purpose: Use floating point registers
 * 07 December 2015
 */

.data

d:  .float 0.14      // Diameter
wt: .float 0.10125   // Weight
cd: .float 0.5       // Coefficient of Drag
dA: .float 0.0023679 // Density of Air
pi: .float 3.1415925 // Pi
pd: .float 0.0       // Holds product

outVt: .asciz "Velocity = %f ft/sec\n"
outDP: .asciz "Dynamic Pressure = %f lb/ft^2\n"

.balign 4
return: .word 0

.global main
main:
    LDR R1, address_of_return
	STR LR, [R1]
    
	// Get address of values
    LDR R1, address_of_d
	LDR R2, address_of_wt
	LDR R3, address_of_cd
	LDR R4, address_of_dA
	LDR R5, address_of_pi
	LDR R6, address_of_pd

	// Load values
	VLDR S16, [R1]
	VLDR S18, [R2]
	VLDR S20, [R3]
	VLDR S22, [R4]
	VLDR S24, [R5]
	VLDR S26, [R6]

	VMUL.F32 S18, S18, #8  // 8*Wt
	VMUL.F32 S22, S24, S22 // pi * p
	VMUL.F32 S16, S16, S16 // d * d
	VMUL.F32 S20, S16, S20 // d * d * Cd
	VMUL.F32 S26, S22, S20 // (pi * p) * (d * d * Cd)
	VDIV.F32 S16, S18, S26 // S

	B _sqrt

_sqrt:
    // S16 is S
	VDIV.F32 S20, S16, #2 // Xn
	VMOV S22, #0          // Xn + 1
	VMOV S26, S20         // Temp

	// Xn != Xn + 1
	_while_R2_DNE_R3:
	    VCMP.F32 R2, R3
		BEQ _printVt
		    VMOV S20, S26
			VDIV.F32 S22, S16, S20
			VADD.F32 S22, S20, S22
			VDIV.F32 S22, S22, #2
			VMOV S26, S22
		BAL _while_R2_DNE_R3

_printVt:
    // Output Velocity
	LDR R0, address_of_outVt
	VMOV R2, R3, S20
	VSTR D1, [SP]
	VSTR D2, [SP, #8]
	VSTR D3, [SP, #16]
	BL printf
    
	// Finding q
	// INIT dA
	LDR R1, address_of_dA
	VLDR S22, [R1]
	VMUL.F32 S20, S20, S20 // Vt * Vt
	VMUL.F32 S22, S22, S20
	VDIV.F32 S16, S22, #2
    
	// Output Dynamic Pressure
	LDR R0, address_of_outDP
	VMOV R2, R3, S20
	VSTR D1, [SP]
	VSTR D2, [SP, #8]
	VSTR D3, [SP, #16]
	BL printf
	
	// SYS_EXIT
    LDR R1, address_of_return
	LDR LR, [R1]
	BX LR

address_of_d:      .word d
address_of_wt:     .word wt
address_of_cd:     .word cd
address_of_dA:     .word dA
address_of_pi:     .word pi
address_of_pd:     .word pd
address_of_outVt:  .word outVt
address_of_outDP:  .word outDP
address_of_return: .word return

/* Extern */
.global printf

