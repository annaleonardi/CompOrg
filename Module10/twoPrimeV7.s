.text
.global main

main:
    # push stack
    SUB sp, sp, #12  // Allocate space on the stack
    STR lr, [sp, #4]  // Save the return address

getInputLoop:
    // Prompt the user for input
    LDR r0, =inputPrompt
    BL printf

    // Read user input into r0
    BL scanf

    // Check if the user wants to exit (-1)
    CMP r0, #-1
    BEQ exitProgram

    // Check if the input is less than or equal to 2, which is not prime
    CMP r0, #2
    BLE notPrime

    // Set r4 to the user's input
    MOV r4, r0

    // Continue with the prime-checking logic
    BL isPrime

    // Print the result
    B getInputLoop

isPrime:
    // Initialize r6 to start dividing from 2
    MOV r6, #2

startDivideLoop:
    CMP r6, r4
    BEQ primeFound

    MOV r0, r4
    MOV r1, r6
    BL __aeabi_idivmod

    // Check if the remainder is 0
    CMP r1, #0
    BEQ notPrime

    ADD r6, r6, #1
    B startDivideLoop

primeFound:
    // Print that the number is prime
    LDR r0, =output
    MOV r1, r4
    BL printf
    BX lr

notPrime:
    // Print that the number is not prime
    LDR r0, =notPrimeMessage
    MOV r1, r4
    BL printf
    BX lr

exitProgram:
    LDR lr, [sp, #4]  // Restore the return address
    ADD sp, sp, #12  // Deallocate the stack space
    MOV pc, lr  // Return from the program

.data
   output: .asciz "Number %d is prime\n"  // Format for printing prime numbers
   inputPrompt: .asciz "Enter a number (-1 to exit): "  // Prompt for user input
   notPrimeMessage: .asciz "Number %d is not prime\n"  // Format for printing non-prime numbers

