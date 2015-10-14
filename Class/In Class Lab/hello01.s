/* hello01.s */

.data

greeting: .asciz "Hello world"

.balign 4
return: .word 0

.text

.global main
main:
    LDR R1, address_of_return
    STR LR, [R1]

    LDR R0, address_of_greeting
    
   BL puts

   LDR R1, address_of_return
   LDR LR, [R1]
   BX LR

address_of_greeting: .word greeting
address_of_return: .word return

.global puts

