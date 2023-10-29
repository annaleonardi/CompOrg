#
# File Name: charCheck2.s
# Author: Anna Leonardi
# Date: 10/29/2023
# Purpose: An assembly program to to check if a user input value is a alphabetic character or not 
#	  by determining if it is a lower or uppercase letter
#
.text
.global main
main:
#  push stack
   SUB sp, sp, #4
   STR lr, [sp], #0

#  prompt for value
   LDR r0, =prompt  //load prompt in r0 to print it
   BL printf

#  read value  from user
   LDR r0, =format  //road format of input in r0 to read it
   LDR r1, =char  //load input char in r1 to read it 
   BL scanf

   LDR r0, =char  //load address char to r0
   LDR r0, [r0]  //load value of char to r0
   BL charCheck  //call function to check character

#  pop stack
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
	#push stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	MOV r4, #'A'  //load value of A in r4
	CMP r0, r4  //compare input char in r0 with A in r4
	BLT notChar //if r0 < A then it is not an alphabetic character

	MOV r4, #'z'  //load value of z in r4
	CMP r0, r4  //compare input char in r0 with z in r4
	BLT isChar  //if r0 < z then it is an alphabetic character
	B notChar  //else it is not

   isChar:
	LDR r0, =charOutput  //load alphabetic char outut to r0 to print it
	BL printf
	B endIf  //call end of if statement

   notChar:
	LDR r0, =charNotOutput  //load non alphabetic char output to r0 to print it
 	BL printf
	B endIf  //call end of if statement

   endIf:  //end of if statement

#  Pop stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   charOutput: .asciz "The character is an alphabetical value\n"
   charNotOutput: .asciz "The character is NOT an alphabetical value\n"
