.globl main
main:
    LDR R1, addr_value1
	VLDR S14, [R1]
	VCVT.F64.F32 D5, S14

	LDR R0, =string
	VMOV R2, R3, D5
	BL printf

	MOV R7, #1
	SWI 0

addr_value1: .word value1

.data
value1: .float 1.54321
string: .asciz "Float: %f\n"

