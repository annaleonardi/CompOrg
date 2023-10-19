# miles2kilometer.s
# An assembly program to convert distance from miles to kilometers

.text
.global main
main:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #prompt for value
   LDR r0, =prompt1
   BL printf

   #read value from user
   LDR r0, =input1
  // LDR r1, =num1
   SUB sp, sp, #4
   MOV r1, sp
   BL scanf
   LDR r0, [sp, #0]
   ADD sp, sp, #4

   #Convert to celsius
  // LDR r0, =num1
  // LDR r0, [r0]
   BL miles2kilometer
  // MOV r1, #161
  // MUL r0, r0, r1
  // MOV r1, #100
  // BL __aeabi_idiv
   MOV r1, r0

   #print the output
   LDR r0, =format1
   BL printf

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt1: .asciz "Enter the distance in miles that you want comverted to kilometers: \n"
   format1: .asciz "\nThe distance in kilometers is: %d\n"
   input1: .asciz "%d"
   num1: .word 0

