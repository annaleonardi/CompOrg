.text
.global main

remainder:
   CMP r0, #0   // Check if the dividend (r0) is zero
   BEQ .divisible  // If it's zero, it's divisible; branch to the .divisible label
   MOV r1, #0   // Initialize the remainder (r1) to zero

.divide:
   SUBS r0, r0, r1  // Subtract the remainder from the dividend
   ADDS r1, r1, #1  // Increment the remainder

   CMP r0, #0   // Check if the dividend is zero
   BNE .divide  // If it's not zero, continue dividing
   BX lr

.divisible:
   MOV r0, #0  // Return 0 if divisible
   BX lr

main:
   SUB sp, sp, #16
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   STR r6, [sp, #12]

   LDR r0, =inputMessage  // Display a message to enter 'n'
   BL printf

   LDR r0, =format
   LDR r1, =n
   BL scanf

   LDR r5, =n  // Load the address of 'n'
   LDR r5, [r5]  // Load the value of 'n'

   MOV r4, #3       // Start with the number 3

   startLoop:
      CMP r4, r5   // Compare the current number with 'n'
      BGT endLoop  // If the current number is greater than 'n', exit the loop

      MOV r6, #2   // Initialize divisor (2)

      innerLoop:
         CMP r6, r4   // Compare the divisor with the current number
         BGE prime    // If the divisor is greater or equal, the number is prime

         BL remainder  // Check if r4 is divisible by r6

         CMP r0, #0   // Check if the result is zero (divisible)
         BEQ notPrime // If it's zero, it's not prime

         ADD r6, r6, #1  // Increment the divisor
         B innerLoop

      prime:
         LDR r0, =outputPrime
         MOV r1, r4
         BL printf
         B nextNumber

      notPrime:
         LDR r0, =outputNonPrime
         MOV r1, r4
         BL printf

      nextNumber:
         ADD r4, r4, #1  // Increment the current number
         B startLoop

   endLoop:
      LDR lr, [sp, #0]
      LDR r4, [sp, #4]
      LDR r5, [sp, #8]
      LDR r6, [sp, #12]
      ADD sp, sp, #16
      MOV pc, lr

.data
   outputPrime: .asciz "%d is prime.\n"
   outputNonPrime: .asciz "%d is not prime.\n"
   inputMessage: .asciz "Enter a number (n): "
   format: .asciz "%d"
   n: .word 0  // Initialize 'n' to 0

