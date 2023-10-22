#
# File Name: CToF.s
# Author: Anna Leonardi
# Date: 10/21/2023
# Purpose: An assembly program to convert temperature from celsius to farenheight
#

.text

.global main

main:
# Save return to os on stack
   SUB sp, sp, #4
   STR lr, [sp,#0]

# Prompt for an input
   LDR r0, =prompt1  //load input prompt to r0 to print it
   BL printf  //print input prompt in r0

# Scanf
   LDR r0, =input1  //load inout value to r0
   SUB sp, sp, #4  //free up 4 bites of space on the stack pointer
   MOV r1, sp  //move stack pointer t0 r1
   BL scanf  //read input values
   LDR r0, [sp, #0]  //load stack pointer to r0
   ADD sp, sp, #4  //add 4 bites back to stack pointer

# Convert
   BL CToF  //call celsius to farenheight function
   MOV r1, r0  //store r0 in r1

# Print inches
   LDR r0, =format1  //load format string to r0 to print it
   BL printf  //print format string in r0 and converted value in r1

# Return to the OS
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt1: .asciz "Enter the temp in Celsius: \n"
   format1: .asciz "\nThe temp in Farenheight is: %d\n"
   input1: .asciz "%d"
   num2: .word 0   
