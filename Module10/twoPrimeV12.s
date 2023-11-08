.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp, #0]

   # Initialize by prompting the user, answer in r4
   LDR r0, =prompt
   BL printf
   LDR r0, =input
   LDR r1, =num
   BL scanf
   LDR r1, =num
   LDR r4, [r1, #0]

   # r4 - number from the user
   # r5 - start at 3
   # r6 - 2 for dividing
   MOV r5, #3  // Initialize r5 to start from 3
   MOV r6, #2  // Initialize r6 to start dividing from 2

StartSentinelLoop:
   CMP r4, #-1
   BEQ EndSentinelLoop

   # Input Check
   CMP r5, r4
   BGT notPrime

   # divide loop
   # initialize the loop,
   # r0 - counter
   # r4 - loop limit
   # r5 - remainder
   MOV r0, #0
   MOV r7, #0

StartDivideLoop:
   CMP r6, r5, LSR #1
   BGT EndCountingLoop

   # Loop Block
   MOV r0, r4
   MOV r1, r6
   BL __aeabi_idivmod  // Call __aeabi_idivmod to perform division and get the remainder
   MOV r7, r1  // Get the remainder from r1

   CMP r7, #0  // Compare the remainder with 0
   BEQ notPrime  // If remainder is 0, the number is not prime

   # Get next value
   ADD r6, r6, #1

   B StartDivideLoop

EndCountingLoop:

LDR r0, =output
MOV r1, r5
BL printf

B EndInputCheck

notPrime:
   # Print badInput message
   ADD r5, r5, #2
   MOV r6, #2
   LDR r0, =badInput
   BL printf

EndInputCheck:
   B StartSentinelLoop

EndSentinelLoop:

MOV r0, #0
LDR lr, [sp, #0]
ADD sp, sp, #4
MOV pc, lr
# End main

.data
   prompt: .asciz "Please enter a numberor -1 to exit\n"
   badInput: .asciz "Your input value is NOT prime \n"
   output: .asciz "Your input value is prime\n"
   input: .asciz "%d"
   num: .word 0
