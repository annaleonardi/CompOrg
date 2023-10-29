.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp], #0

#  prompt for value
   LDR r0, =prompt
   BL printf

#  read value  from user
   LDR r0, =format
   LDR r1, =char
   BL scanf

###   MOV r0, #'U'
   LDR r0, =char
   LDR r0, [r0]
   BL charCheck

   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "Enter any character: \n"
   char: .space 40
   format: .asciz "%s"

#  END main



.text
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

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

   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   charOutput: .asciz "The character is an alphabetical value\n"
   charNotOutput: .asciz "The character is NOT an alphabetical value\n"
