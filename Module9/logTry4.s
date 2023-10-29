.text
.global main

@ Function to check if a character is an alphabetic letter
CheckAlphabetic:
    PUSH {lr}     @ Save the link register
    MOV r2, #0    @ Initialize r2 as 0 (0 means not an alphabetic character)

    CMP r0, #'A'  @ Compare with 'A' (uppercase A)
    BLT NotAlphabetic
    CMP r0, #'Z'  @ Compare with 'Z' (uppercase Z)
    BLE IsAlphabetic

    CMP r0, #'a'  @ Compare with 'a' (lowercase a)
    BLT NotAlphabetic
    CMP r0, #'z'  @ Compare with 'z' (lowercase z)
    BGT NotAlphabetic

IsAlphabetic:
    MOV r2, #1  @ Set r2 to 1 (1 means an alphabetic character)

NotAlphabetic:
    MOV r0, r2     @ Return the result in r0 (0 for not alphabetic, 1 for alphabetic)
    POP {lr}       @ Restore the link register
    BX lr          @ Return

main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf

    LDR r0, =input
    LDR r1, =character
    BL scanf

    LDR r1, =character
    BL CheckAlphabetic

    CMP r0, #1        @ Check the result from CheckAlphabetic
    BEQ IsAlphabetic  @ Branch to IsAlphabetic if it's an alphabetic character
    B NotAlphabetic

IsAlphabetic:
    LDR r0, =formatChar
    BL printf
    B EndIf

NotAlphabetic:
    LDR r0, =formatNotChar
    BL printf

EndIf:
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
prompt: .asciz "Enter any character: \n"
input: .asciz "%s"
formatChar: .asciz "\nThe character you entered is an alphabetical value\n"
formatNotChar: .asciz "\nThe character entered is NOT an alphabetical value\n"
character: .space 40


