#
# File Name: onePrimeV3.s
# Author: Anna Leonardi
# Date: 11/5/2023
# Purpose: An assembly program to find prime numbers from 3 to 100 (n) in a loop by dividing the number n by all numbers from 2..n/2 in an inner loop
#
.text
.global main

.equ MAX_N, 100  // Maximum value of 'n'

main:
    # push stack
    SUB sp, sp, #12  // Allocate space on the stack
    STR lr, [sp, #4]  // Save the return address

    # initialize
    MOV r4, #3  // Initialize r4 to start from 3
    LDR r5, =MAX_N  // Load the maximum value of 'n'
    MOV r6, #2  // Initialize r6 to start dividing from 2

    startPrimeLoop:
	CMP r4, r5  // Compare r4 (current number) with r5 (maximum 'n')
	BGT endPrimeLoop  // If r4 > r5, exit the program

	MOV r7, #0  // Initialize r7 to store the remainder

	startDivideLoop:
	    CMP r6, r4, LSR #1  // Compare r6 with r4/2
	    BGT isPrime  // If r6 > r4/2, it's prime, so proceed to isPrime

		MOV r0, r4
		MOV r1, r6
		BL __aeabi_idivmod  // Call __aeabi_idivmod to perform division and get the remainder
	    	MOV r7, r1  // Get the remainder from r1

	    	CMP r7, #0  // Compare the remainder with 0
            	BEQ notPrime  // If remainder is 0, the number is not prime

            ADD r6, r6, #1  // Increment r6 for the next division
            B startDivideLoop  // Repeat the division

	isPrime:
	    // Print the prime number
	    LDR r0, =output
	    MOV r1, r4
	    BL printf

	notPrime:
            ADD r4, r4, #2  // Increment r4 by 2 to check the next odd number
            MOV r6, #2  // Reset r6 to 2 for the next number
            B startPrimeLoop  // Repeat the prime check

    endPrimeLoop:

    LDR lr, [sp, #4]  // Restore the return address
    ADD sp, sp, #12  // Deallocate the stack space
    MOV pc, lr  // Return from the program

.data
   output: .asciz "%d\n"  // Format for printing prime numbers

