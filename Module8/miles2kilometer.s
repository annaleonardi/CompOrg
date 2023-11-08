# miles2kilometer.s
# An assembly program to calculate Miles to Kilometers
.text
.global main

main:
   # push stack
   SUB sp, sp, #4
   STR lr, [sp]

   # prompt for an input in milrd
   LDR r0, =prompt1
   BL printf

   # scanf
   LDR r0, =input1
   LDR r1, =miles1
   BL scanf

   # convert
  // BL miles2kilometer // call miles2kilometer to calculate
   LDR r0, =miles1
   LDR r0, [r0]
   MOV r1, #161
   MUL r0, r0, r1
   MOV r1, #100
   BL __aeabi_idiv
   MOV r1, r0 // move value to r1 so it can print it

   # print kilometers
   LDR r0, =format1
   BL printf

   # pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt1: .asciz "Enter the distance in miles you want in kilometers: %d\n"
   format1: .asciz "\nThe length in kilometers: is %d\n"
   input1: .asciz "%d"
   miles1: .word 0

