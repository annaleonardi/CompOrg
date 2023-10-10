#
# File Name: inchFeet2.s
# Author: Anna Leonardi
# Date: 01/10/2023
# Purpose: Convert feet and inches to just inches and to feet with inch remainder
#
.text
.global main
main:
   #push stack
   SUB sp, sp, #4
   STR lr, [sp]

   #prompt for feet value
   LDR r0, =firstPrompt1
   BL printf

   #read feet value from user
   LDR r0, =formatString1
   LDR r1, =feet //address of where totalMinutes is not value
   BL scanf

   #prompt for inch value
   LDR r0, =secondPrompt1
   BL printf

   #read inch value from user
   LDR r0, =formatString1
   LDR r1, =inch
   BL scanf

   #do Feet to Inch math
   LDR r1, =feet //address of totalFeet in r0
   LDR r1, [r1] //store actual value of r0 which is the address of total minutes in r0 to get the actual value
   LDR r2, =inch
   LDR r2, [r2]
   MOV r3, #12 // to mult by 12
   MUL r1, r1, r3
   ADD r1, r2, r1
   MOV r4, r1

   #do Inch to Feet math
   LDR r2, =feet
   LDR r2, [r2]
   LDR r0, =inch
   LDR r0, [r0]
   MOV r5, r2 //input feet
   MOV r6, r0 //input inches
   MOV r1, #12
   BL __aeabi_idiv //inches converted to feet stored in r0
   ADD r2, r5, r0
   MOV r9, r2 //inches converted to feet
   MOV r7, r0
   MUL r7, r7, r1
   SUB r8, r6, r7 //r8 is remainder

   #output total inches
   MOV r1, r4
   LDR r0, =inchOutput1
   BL printf

   #output total feet
   MOV r1, r9
   MOV r2, r8
   LDR r0, =feetOutput1
   BL printf

   #pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   inchOutput1: .asciz "\nThat is %d total inches\n"
   feetOutput1: .asciz "\nThat is %d feet and %d inches\n"
   firstPrompt1: .asciz "Enter an amount in feet: "
   secondPrompt1: .asciz "Enter an amount in inches: "
   feet: .word 0
   inch: .word 0
   formatString1: .asciz "%d"
