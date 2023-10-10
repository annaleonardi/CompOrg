#
# File Name: Swap.s
# Author: Anna Leonardi
# Date: 10/01/2023
# Purpose: Extra credut q, swap without an extra variable using EOR
#
.text
.global main
main:
   #push
   SUB sp, sp, #4
   STR lr, [sp]

   #prompt for value one
   LDR r0, =promptOne
   BL printf

   #read value one from user
   LDR r0, =inputFormatString
   LDR r1, =numOne
   BL scanf

   #prompt for value two
   LDR r0, =promptTwo
   BL printf
   
   #read value two from user
   LDR r0, =inputFormatString
   LDR r1, =numTwo
   BL scanf

   #perform EOR swap
   LDR r1, =numOne
   LDR r1, [r1]
   LDR r2, =numTwo
   LDR r2, [r2]
   EOR r1, r1, r2
   EOR r2, r1, r2
   EOR r1, r1, r2
   

   #output value
   LDR r0, =output
   BL printf

   #pop
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   output: .asciz "Swapped values: r0 = %d and r1 = %d\n"
   promptOne: .asciz "Enter value for r0: "
   promptTwo: .asciz "Entervalue for r1: "
   inputFormatString: .asciz "%d"
   numOne: .word 0
   numTwo: .word 0
