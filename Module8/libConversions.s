.global Ft2Inches
.global F2C

.text
F2C:
   # r0 = (r0-32)*5/9
   MOV r1, #-32
   ADD r0, r0, r1
   MOV r1, #5
   MUL r0, r0, r1
   MOV r1, #9
   BL __aeabi_idiv
   // result will be in r0

   # garbage code to illustrate something in lecture
   ADD r3, r3, r3

   MOV pc, lr

.data

#End F2C

.text

Ft2Inches:
   //input r0 output r0
   # Convert feet to inches
   MOV r1, #12
   MUL r0, r0, r1

	   MOV pc, lr

.data

#END Ft2Inches
