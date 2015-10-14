/* printf01.s */

.data

.balign 4
message1: .asciz "Hey, type a number."

.balign 4
message2: .asciz "I read the number %d\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
number_read: .word 0

.balign 4
return: .word 0

.text

.global main 
main:
    LDR R1, address_of_return
    STR LR, [R1]
    
    LDR R0, address_of_message1
    BL printf

    LDR R0, address_of_scan_pattern
    LDR R1, address_of_number_read
    BL scanf

    LDR R0, address_of_message2
    LDR R1, address_of_number_read
    LDR R1, [R1]
    BL printf

    LDR R0, address_of_number_read
    LDR R0, [R0]

    LDR LR, address_of_return
    LDR LR,[LR]
    BX LR

address_of_message1:     .word message1
address_of_message2:     .word message2
address_of_scan_pattern: .word scan_pattern
address_of_number_read:  .word number_read
address_of_return:       .word return

.global printf
.global scanf
