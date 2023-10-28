#
#
#
#
#
#
#
.text
.global main
main:
#  push stack
   SUB sp, sp, #4
   STR lr, [sp]

#  prompt for character
   LDR r0, =prompt
   BL printf

#  read user input
   LDR r0, =input
   LDR r1, =character
   BL scanf
   
#

#  Check
   MOV r2, #0  //all bits are 0
   CMP r1, #0x41
	ADDGE r2, #1   //if true, bit 0 is changed to 1

   MOV r3, #0
   CMP r1, #0x5A
	ADDLE r3, #1

   ADD r2, r2, r3  //results from first AND, if true r1 is uppercase

   MOV r0, #0
   CMP r1, #0x61
	ADDGE r3, #1

   MOV r3, #0
   CMP r1, #0x7A
	ADDLE r0, #1

   AND r3, r3, r0  //results from seconf AND, if true r1 is lowercase
   ORR r2, r2, r3  //results from OR, if true r1 is a character
   

#  print the output
   LDR r0, =format //fix in BL function
   LDR r1, =character
   BL printf

#  pop stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
#  prompt user to enter a character
   prompt: .asciz "Enter any character: \n"

#  format for input (read a string)
   input: .asciz "%s"

#  format of the program output
   format: .asciz "\n The character you entered is %s\n"
   formatChar: .asciz "\n The character  you entered is an alphabetical value\n"
   formatNotChar: .asciz "\n The character entered is NOT an alphabetical value\n"

#  reserves space in the memory for input
   character: .space 40



#  END main

.text
logicalCharCheck:
#  push stack
   SUB sp, sp, #8
   STR lr, [sp]

#    


#  pop stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr   

.data



#   END logicalCharCheck
