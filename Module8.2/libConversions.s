.global miles2kilometer
.global kph

.text

miles2kilometer:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert miles to kilometers
   MOV r1, #161
   MUL r0, r0, r1
   MOV r1, #100
   BL __aeabi_idiv

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
#END miles2kilometer



.text

kph:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert kilometers to kilometers per hour
   MOV r2, r0 
   MOV r0, r1
   BL miles2kilometer
   MOV r2, r1
   BL __aeabi_idiv

   #pop stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr
.data
#END kph
