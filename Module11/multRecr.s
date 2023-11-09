.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   LDR r0, =promptM
   BL printf
   LDR r0, =format
   LDR r1, =m
   BL scanf

   LDR r0, =promptN
   BL printf
   LDR r0, =format
   LDR r2, =n
   BL scanf

   LDR r0, =m
   LDR r0, [r0]
   LDR r1, =n
   LDR r1, [r1]
   BL Mult
   MOV r1, r0

   LDR r0, =output
   BL printf

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   promptM: .asciz "\nEnter a number to multiply: "
   promptN: .asciz "\nEnter a how many times to multiply: "
   output: .asciz "\nYour result is %d\n"
   format: .asciz "%d"
   n: .word 0
   m: .word 0

# END main



.text
Mult:
   # push the stack
   SUB sp, sp, #12  //sub 4+4 because we are storing 2 parameters
   STR lr, [sp]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   
   MOV r4, r0  //to safely store the input in r4
   MOV r5, r1
   
   # if (n==1) return m
   CMP r5, #1
   BNE Else  // if not equal go into recursion
	MOV r0, r4
	B Return  //base case ends recursion

   # else
   Else:
	SUB r0, r5, #1  //next value in r0
	BL Mult  //return value in r0
	ADD r0, r4, r4  //store in r0 what came back from the sum program plus r4
	B Return

	Endif:  //never used but still putting it in code for stuctured code

   # pop the stack
   Return:  //put a return label
   LDR lr, [sp]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   ADD sp, sp, #12
   MOV pc, lr
.data

# END summation
