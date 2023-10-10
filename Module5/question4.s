#
# File Name: question4.s
# Author: Anna Leonardi
# Date: 10/01/2023
# Purpose: answer question 4, multiplying by 10 using LSL and ADD
#
.text
.global main
main:
   #push
   SUB sp, sp, #4
   STR lr, [sp]

   #prompt for value
   LDR r0, =prompt
   BL printf

   #read value
   LDR r0, =inputFormatString
   LDR r1, =num
   BL scanf

   #do math
   LDR r0, =num
   LDR r0, [r0]
   LSL r4, r0, #3
   ADD r4, r0, r4
   ADD r4, r0, r4

   #output
   MOV r1, r4 //make space in r0
   LDR r0, =output
   BL printf

   #pop
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "Enter a number: "
   output: .asciz "\nMultiplied by 10 is: %d\n"
   inputFormatString: .asciz "%d"
   num: .word 0
