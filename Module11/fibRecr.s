.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   LDR r0, =prompt
   BL printf
   LDR r0, =format
   LDR r1, =number
   BL scanf

   LDR r0, =number
   LDR r0, [r0]
   BL Fib
   MOV r1, r0

   LDR r0, =output
   BL printf

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "\nEnter a value to calcuate it's Fibonacci sequence: "
   output: .asciz "\nYour result is: %d\n"
   format: .asciz "%d"
   number: .word 0

# END main



.text
Fib:
   # push the stack
   SUB sp, sp, #8  //sub 4+4 because we are storing 2 parameters
   STR lr, [sp]
   STR r4, [sp, #4]
   
   MOV r4, r0  //to safely store the input in r4
   
   # if (n==n-1) || (n==0) || (n==1) return n
   CMP r7, #1
   BNE Else
	CMP r4, #1
	BGT Else  // if not equal go into recursion
	   CMP r4, #0
	   BLT Else  // if not equal go into recursion
	      B Return  //base case ends recursion

   # else
   Else:
	SUB r0, r4, #1
	SUB r1, r4, #2
	ADD r7, r7, #1
	BL Fib
	ADD r0, r0, r1
	#ADD r0, r4, r0  //store in r0 what came back from the sum program plus r4
	B Return

   Endif:  //never used but still putting it in code for stuctured code

   # pop the stack
   Return:  //put a return label
   LDR lr, [sp]
   LDR r4, [sp, #4]
   ADD sp, sp, #8
   MOV pc, lr
.data

# END fibonacci
