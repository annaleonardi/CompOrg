.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =prompt
    BL printf

    LDR r0, =input
    LDR r1, =character
    BL scanf

    LDR r1, =character

    CMP r1, #'A'
    BLT NotChar
    CMP r1, #'z'
    BGT NotChar
    CMP r1, #'Z'
    BGT IsChar
    CMP r1, #'a'
    BLT IsChar

    IsChar:
	LDR r0, =formatChar
	BL printf
	B EndIf

    NotChar:
	LDR r0, =formatNotChar
	BL printf
	B EndIf

    EndIf:

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
prompt: .asciz "Enter any character: \n"
input: .asciz "%s"
formatChar: .asciz "\nThe character you entered is an alphabetical value\n"
formatNotChar: .asciz "\n The character entered is NOT an alphabetical value\n"
character: .space 40

