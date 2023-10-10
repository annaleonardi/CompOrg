#
# Program Name:   printInt
# Author: Anna Leonardi
# Date:     9/24/2023
# Purpose: Uses scanf for an integer using data memory
# Input:
#   - input: User entered number
# Output:
#   - format: Prints the number
#

.text
.global main
main:
   # pop the stack record
   SUB sp, sp, #4
   STR lr, [sp, #0]

   # prompt the user to enter an integer
   LDR r0, =prompt1
   BL printf

   # read the user integer
   LDR r0, =format1
   LDR r1, =num1
   BL scanf

   # print the user input
   LDR r0, =output1
   LDR r1, =num1
   LDR r1, [r1, #0]
   BL printf

   # push the stack record
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr


.data
   prompt1: .asciz "Enter an integer number: "		 // Prompt the user to enter a number
   format1: .asciz "%d"					// Format of the user input, %d means integer number
   num1:    .word 0					// Allocates space for a word-aligned 4-byte value in the memory
   output1: .asciz "You entered the number %d\n"	// Format to print the entered number
