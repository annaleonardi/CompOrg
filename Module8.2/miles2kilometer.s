#
# File Name: miles2kilometer.s
# Author: Anna Leonardi
# Date: 10/21/2023
# Purpose: An assembly program to convert distance from miles to kilometers
#

.text
.global main
main:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #prompt for value
   LDR r0, =prompt1  //load input prompt into r0 so it can be printed
   BL printf  //print input prompt stored in r0

   #read value from user
   LDR r0, =input1  //load input value into r0
   SUB sp, sp, #4  //free 4 bites on the stack pointer
   MOV r1, sp  //store stack pointer in r1
   BL scanf  //read input value stored in r0
   LDR r0, [sp, #0]  //load stack pointer to r0
   ADD sp, sp, #4  //add space back to stack pointer

   #Convert to kilometers 
   BL miles2kilometer  //call miles2kilometer function, input value in r0
   MOV r1, r0  //store r0 safely in r1

   #print the output
   LDR r0, =format1  //load string format in r0
   BL printf  //print string format in r0 and converted input value in r1

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt1: .asciz "Enter the distance in miles that you want comverted to kilometers: \n"
   format1: .asciz "\nThe distance in kilometers is: %d\n"
   input1: .asciz "%d"


