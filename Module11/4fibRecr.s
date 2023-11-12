#
# File Name: 4fibRecr.s
# Author: Anna Leonardi
# Date: 11/12/2023
# Purpose: Q2 Module11, implement a program to calculate a Fibonacci number recursively. Fib(n) = (n-1) + (n-2).
#

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

   LDR r0, =number //load address of input to r0 to pass it to Fib function
   LDR r0, [r0]  //load value of r0 to r0
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
   STR r6, [sp, #12]

   MOV r4, r0  // safely store r0 input to preserved register r4

   # if (n==0) || (n==1) return n
   CMP r4, #0
   BEQ Return
   CMP r4, #1
   BEQ Return
   # if you went through one recursion loop return
   CMP r1, #1
   BEQ Return

   # else
   SUB r0, r4, #1  // subtract 1 from input in r4 and store in r0
   ADD r1, r1, #1  // increment recursion counter
   BL Fib
   MOV r6, r0  // save Fib(n-1) in r6

   SUB r0, r4, #2  // subtract 2 from input in r4 and store in r0
   BL Fib
   ADD r0, r6, r0  // save Fib(n-1) + Fib(n-2) in r0

   # pop the stack
   Return:
   LDR lr, [sp, #4]
   LDR r4, [sp, #8]
   LDR r6, [sp, #12]
   ADD sp, sp, #12
   MOV pc, lr

.data

# END fibonacci

