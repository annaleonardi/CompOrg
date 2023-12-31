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
   STR r8, [sp, #4]
   STR r3, [sp, #4]

#  prompt for character
   LDR r0, =prompt
   BL printf

#  read user input
   LDR r0, =input
   LDR r1, =character
   BL scanf
   
#  Check
   LDR r1, =character
   MOV r8, r1 

#  (if char > 0x41)
   MOV r2, #0  //all bits are 0
   CMP r8, #'A'
	MOVGE r2, #1   //if true, bit 0 is changed to 1

#  (if char < 0x5a)
   MOV r3, #0
   CMP r8, #'Z'
	MOVLE r3, #1

   AND r2, r2, r3  //results from first AND, if true r1 is uppercase

#  (if char > 0x61
   MOV r3, #0
   CMP r1, #'a'
	MOVGE r3, #1

#  (if char < 0x7a)
   MOV r0, #0
   CMP r1, #'z'
	MOVLE r0, #1

   AND r3, r3, r0  //results from second AND, if true r1 is lowercase
   ORR r2, r2, r3  //results from OR, if true r1 is a character

   #if r2 = 1 -> char, else not char
   MOV r0, #0
   CMP r2, r0
	BGT Else
	#code block for if not char
	LDR r0, =formatNotChar
	BL printf
        B EndIf 

   Else:
	#Code block for else char 
	LDR r0, =formatChar
	BL printf

EndIf:   

#  print the output
#   LDR r0, =format //fix in BL function
#   LDR r1, =character
#   BL printf

#  pop stack
   LDR lr, [sp, #0]
   LDR r8, [sp, #4]
   LDR r3, [sp, #4]
   ADD sp, sp, #12
   MOV pc, lr

.data
#  prompt user to enter a character
   prompt: .asciz "Enter any character: \n"

#  format for input (read a string)
   input: .asciz "%s"

#  format of the program output
   format: .asciz "\nThe character you entered is %s\n"
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
