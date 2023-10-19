.global Ft2Inches
.text

Ft2Inches:
   //input r0 output r0
   # Convert feet to inches
   MOV r1, #12
   MUL r0, r0, r1

	   MOV pc, lr

.data

#END Ft2Inches
