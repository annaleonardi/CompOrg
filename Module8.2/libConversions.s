.global miles2kilometer
.global kph
.global miles
.global hours
.global num1

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
   num1: .word 0
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
   LDR r1, =hours
   LDR r1, [r1]
   BL __aeabi_idiv

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   miles: .word 0
   hours: .word 0
#END kph
