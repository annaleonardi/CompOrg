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
   prompt: .asciz "\nEnter a value to calculate its Fibonacci sequence: "
   output: .asciz "\nYour result is: %d\n"
   format: .asciz "%d"
   number: .word 0

# END main



.text
Fib:
   # push the stack
   SUB sp, sp, #8
   STR lr, [sp, #4]
   STR r4, [sp]

   MOV r4, r0

   # if (n==0) || (n==1) return n
   CMP r4, #1
   BLE Return

   # else
   SUB r0, r4, #1
   BL Fib
   MOV r5, r0  // save Fib(n-1)

   SUB r0, r4, #2
   BL Fib
   ADD r0, r0, r5  // Fib(n-1) + Fib(n-2)

   # pop the stack
   Return:
   LDR lr, [sp, #4]
   LDR r4, [sp]
   ADD sp, sp, #8
   MOV pc, lr
.data

# END fibonacci

