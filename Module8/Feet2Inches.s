# Ft2Inches.s
# An assmbly program to calculate Feet to Inches
   .text
   .global main

main:
# Save return to os on stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

# Prompt for an input in feet
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
   BL Ft2Inches // call Ft2Inches to calculate
   MOV r1, r0 // move value to r1 so it can print it 

# Print inches
   LDR r0, =format1
   BL printf 

# Return to the OS
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr


.data
   prompt1: .asciz "Enter the length in feet you want in inches: \n"
   format1: .asciz "\nThe length in inches is %d\n"
   input1: .asciz "%d"
   num1: .word 0

