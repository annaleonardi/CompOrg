.global Ft2Inches
.global F2C
.global miles2kilometer


.text
F2C:

   # push stack
   SUB sp, sp, #4 // frees up 4 bytes of memory on the stack pointer to save the link register
   STR lr, [sp]

   # r0 = (r0-32)*5/9
   MOV r1, #-32
   ADD r0, r0, r1
   MOV r1, #5
   MUL r0, r0, r1
   MOV r1, #9
   BL __aeabi_idiv
   // result will be in r0

   #pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data

#End F2C



.text

Ft2Inches:

   # push stack
   SUB sp, sp, #4
   STR lr, [sp]

   # Convert feet to inches
   MOV r1, #12
   MUL r0, r0, r1 // input will be in r0 and output will be in r0
  
   # pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data

#END Ft2Inches



.text

miles2kilometer:

   # push stack
   SUB sp, sp, #4 // free up 4 bites on stack pointer to save link registers
   STR lr, [sp] // store stack pointer in link register

   # Convert miles to kilometers (miles * 161 / 100)
   MOV r1, #161
   MUL r0, r0, r1
   MOV r1, #100
   BL __aeabi_idiv

   # pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data

#END miles2kilometer
