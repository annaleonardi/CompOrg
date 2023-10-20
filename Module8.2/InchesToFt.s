# InchesToFt.s
# An assmbly program to calculate Inches to Feet
   .text
   .global main

main:
# Save return to os on stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

# Prompt for an input in inches
   LDR r0, =prompt1
   BL printf

# Scanf
   LDR r0, =input1
   SUB sp, sp, #4
   MOV r1, sp
   BL scanf
   LDR r0, [sp, #0]
   ADD sp, sp, #4

# Convert 
   BL InchesToFt // call InchesToFt to calculate
   MOV r1, r0 // move value to r1 so it can print it 

# Print feet
   LDR r0, =format1
   BL printf // print r0

# Return to the OS
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr


.data
   prompt1: .asciz "Enter the length in inches you want in feet: \n"
   format1: .asciz "\nThe length in feet is %d\n"
   input1: .asciz "%d"
   num3: .word 0

