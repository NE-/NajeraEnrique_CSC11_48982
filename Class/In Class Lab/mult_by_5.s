.data

.balign 4
return: .word 0

.text
.global mult_by_5

mult_by_5:
    LDR R1, address_of_return
    STR LR, [R1]

    ADD R0, R0, R0, LSL #2

    LDR LR, address_of_return
    LDR LR, [LR]
    BX LR
address_of_return: .word return

