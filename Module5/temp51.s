.text
.global main
main:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp]

   #pop the stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
