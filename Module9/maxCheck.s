.global main
.text
main: 
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

#  prompt for value 1
   LDR r0, =prompt1
   BL printf

#  read value 1 from user
   LDR r0, =format
   LDR r1, =num1
   BL scanf

#  prompt for value 2
   LDR r0, =prompt2
   BL printf
   
#  read value 2 from user
   LDR r0, =format
   LDR r1, =num2
   BL scanf

#  prompt for value 3
   LDR r0, =prompt3
   BL printf
   
#  read value 3 from user
   LDR r0, =format
   LDR r1, =num3
   BL scanf

   LDR r1, =num1
   LDR r1, [r1]
   LDR r2, =num2
   LDR r2, [r2]
   LDR r3, =num3
   LDR r3, [r3]

#  if block
   #check r0 <= r1
   MOV r0, #0
   CMP r1, r2
   BLE secondCheck
   	MOVGT r2, r1
	B secondCheck

   secondCheck:
	CMP r2, r3
	BLE thirdCheck
	   LDR r0, =output
	   LDR r1, =num2
	   LDR r1, [r1]
	   BL printf
	   B endIf

   thirdCheck:
	LDR r0, =output
	LDR r1, =num3
	LDR r1, [r1]
	BL printf
	B endIf

   endIf:

#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   output: .asciz "The largest value is: %d\n"
   prompt1: .asciz "Enter a number: "
   prompt2: .asciz "Enter a second number: "
   prompt3: .asciz "Enter a third number: "
   format: .asciz "%d"
   num1: .word 0
   num2: .word 0
   num3: .word 0
