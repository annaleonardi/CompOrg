.text
.global main
main: 
   # push
   SUB sp, sp, #4
   STR lr, [sp, #0]

   # load num1 into a register
   LDR r4, =num1 
      #get into some register the address of the label num1
   LDR r0, [r4, #0] 
      #once I have that address I can load into r0 the value that is an offset of that register
      # now num 25 is in r0

   # show I can override that value with another number
   MOV r0, #7 
       # move into r1 a 7, to show that value in r0 has been changed
   STR r0, [r4, #0] 
      #to show we changed the value of num1 out at memory lets store the value of r0 back out at the address in r4 which is the address of num1

   # pop
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   num1: .word 25
