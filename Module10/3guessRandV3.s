.text
.global main

main:
   SUB sp, sp, #16
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   STR r6, [sp, #12]

   MOV r4, #3       // Start with the number 3
   LDR r5, =n      // Load the upper limit 'n'
   LDR r5, [r5]

   startLoop:
      CMP r4, r5   // Compare the current number with 'n'
      BGT endLoop  // If the current number is greater than 'n', exit the loop

      MOV r6, #2   // Initialize divisor (2)

      innerLoop:
         CMP r6, r4   // Compare the divisor with the current number
         BGE prime    // If the divisor is greater or equal, the number is prime

         BL remainder  // Check if r4 is divisible by r6
         MOV r1, r0    // Copy the result to r1
         MOV r0, #0    // Reset r0 to 0

         CMP r1, #0   // Check if the result is zero (r1 == 0)
         BEQ notPrime // If it's zero, it's not prime

         ADD r6, r6, #1  // Increment the divisor
         B innerLoop

      prime:
         LDR r0, =output
         MOV r1, r4
         BL printf

      notPrime:
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
   output: .asciz "%d, "
   n: .word 25  // Set 'n' to the desired upper limit

