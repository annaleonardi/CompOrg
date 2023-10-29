.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp], #0

   MOV r0, #'U'
   BL charCheck

   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

   charCheck:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r4, #'A'
	CMP r0, r4
	BLT notChar

	MOV r4, #'z'
	CMP r0, r4
	BLT isChar
	B notChar

   isChar:
	LDR r0, =charOutput
	BL printf
	B endIf

   notChar:
	LDR r0, =charNotOutput
 	BL printf
	B endIf

   endIf:

.data
   charOutput: .asciz "The character is an alphabetical value\n"
   charNotOutput: .asciz "The character is NOT an alphabetical value\n"
