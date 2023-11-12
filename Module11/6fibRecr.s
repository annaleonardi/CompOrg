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
   MOV r1, #0  // Set recursion counter to 0
   BL Fib
   MOV r1, r0

   LDR r0, =output
   BL printf

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "\nEnter a value to calculate its Fibonacci sequence: "
   output: .asciz "\nYour result is: %d\n"
   format: .asciz "%d"
   number: .word 0

# END main



.text
Fib:
   # push the stack
   SUB sp, sp, #12
   STR lr, [sp, #4]
   STR r4, [sp, #8]
   STR r5, [sp, #12]

   MOV r4, r0  // n
   MOV r5, r1  // recursion counter

   # if (n==0) || (n==1) return n
   CMP r4, #0
   BEQ Return
   CMP r4, #1
   BEQ Return
   CMP r5, #1
   BEQ Return

   # else
   SUB r0, r4, #1
   ADD r1, r5, #1  // Increment recursion counter
   BL Fib
   MOV r6, r0  // save Fib(n-1)

   SUB r0, r4, #2
   SUB r1, r5, #1  // Reset recursion counter to 0 after the first recursive call
   BL Fib
   ADD r0, r6, r0  // Fib(n-1) + Fib(n-2)

   # pop the stack
   Return:
   LDR lr, [sp, #4]
   LDR r4, [sp, #8]
   LDR r5, [sp, #12]
   ADD sp, sp, #12
   MOV pc, lr

.data

# END fibonacci

