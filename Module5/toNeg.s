#
# Program Name: toNeg.s
# Author: Anna Leonardi
# Date 10/01/2023
# Purpose: Negate a number useing two's complement
#
.text
.global main
main:
   #push
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #display prompt
   LDR r0, =prompt
   BL printf

   #read the input
   LDR r0, =input
   LDR r1, =num
   BL scanf

   #negate number
   LDR r1, =num
   LDR r1, [r1]
   MVN r1, r1
   ADD r1, r1, #1

   #print the number
   LDR r0, =formatString
   //LDR r1, =num
   //LDR r1, [r1, #0]
   BL printf

   #pop
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "Enter an integer: "
   num: .word 0
   input: .asciz "%d"
   formatString: .asciz "\nHere is the negative value of that number: %d\n"
   
