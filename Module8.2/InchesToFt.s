#
# File Name: InchesToFt.s
# Author: Anna Leonardi
# Date: 10/01/2023
# Purpose: An assembly program to calculate inches to feet
#
   .text
   .global main

main:
# Save return to os on stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

# Prompt for an input in inches
   LDR r0, =prompt1  //load input prompt to r0 to print it
   BL printf  //print input prompt in r0

# Scanf
   LDR r0, =input1  //load input value to r0
   SUB sp, sp, #4  //subtract 4 bites of space in stack pointer
   MOV r1, sp  //store stack pointer in r1
   BL scanf  //read input 
   LDR r0, [sp, #0]  //move stack pointer to r0
   ADD sp, sp, #4  //add 4 bites back to the stack pointer

# Convert 
   BL InchesToFt // call InchesToFt to convert input
   MOV r1, r0 // move value to r1 so it can print it 

# Print feet
   LDR r0, =format1  //load format string in r0
   BL printf // print format string in r0  and converted value in r1

# Return to the OS
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr


.data
   prompt1: .asciz "Enter the length in inches you want in feet: \n"
   format1: .asciz "\nThe length in feet is %d\n"
   input1: .asciz "%d"
   num3: .word 0

