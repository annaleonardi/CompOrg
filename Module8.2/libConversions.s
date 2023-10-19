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
   LDR r0, =miles
   LDR r0, [r0]
   BL miles2kilometer
   MOV r1, r0
   LDR r0, =hours
   LDR r0, [r0]
   BL __aeabi_idiv

   #pop stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr
.data
#END kph
