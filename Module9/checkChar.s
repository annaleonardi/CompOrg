#
#
#
#
#
#
#
.text
.global min
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
   outputChar: .asciz "\n The character entered is an alphabetical value\n"
   outputNotChar: .asciz "\n The character entered is NOT an alphabetical value\n"

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
