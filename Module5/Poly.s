.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   LDR r0, =prompt
   BL printf
   LDR r0, =formatString
   LDR r1, =Y
   BL scanf

   #get Y into a reg
   LDR r0, =Y //load address of Y nin r0
   LDR r0, [r0]  //load value of Y into
   MOV r1, #9
   MUL r0, r0, r1
   #divide by 5, div has to be in r0 which already is
   MOV r1, #5
   BL __aeabi_idiv
   #now answer is in r0
   #want to add num in r0 plus num 7
   MOV r1, #7
   ADD r0, r0, r1


   MOV r1, r0
   LDR r0, =output
   BL printf

   LDR lr, [sp]
   ADD sp, sp, #4
   MOv pc, lr
.data
   output: .asciz "\nThe value of X is: %d\n"
   prompt: .asciz "Enter the value for Y: "
   Y: .word 0
   formatString: .asciz "%d"
