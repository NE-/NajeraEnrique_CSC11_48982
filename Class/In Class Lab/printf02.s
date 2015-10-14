/* printf02.s */
.data

.balign 4
message1: .asciz "Hey, type a number."

.balign 4
message2: .asciz "%d times 5 is %d\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
number_read: .word 0

.balign 4
return: .word 0

.balign 4
return2: .word 0

.text

mult_by_5:
    LDR R1, address_of_return2
    STR LR, [R1]

    ADD R0, R0, R0, LSL #2

    LDR LR, address_of_return2
    LDR LR, [LR]
    BX LR

address_of_return2: .word return2

.global main
main:
    LDR R1, address_of_return
    STR LR, [R1]
    
    LDR R0, address_of_message1
    BL printf
    
    LDR R0, address_of_scan_pattern
    LDR R1, address_of_number_read
    BL scanf

    LDR R0, address_of_number_read
    LDR R0, [R0]
    BL mult_by_5

    MOV R2, R0
    LDR R1, address_of_number_read
    LDR R1, [R1]
    LDR R0, address_of_message2
    BL printf

    LDR LR, address_of_return
    LDR LR, [LR]
    BX LR

/* address var */
address_of_message1:     .word message1
address_of_message2:     .word message2
address_of_scan_pattern: .word scan_pattern
address_of_number_read:  .word number_read
address_of_return:       .word return

/* External */
.global printf
.global scanf
