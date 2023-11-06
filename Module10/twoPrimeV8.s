.text
.global main

main:
    # Push stack
    SUB sp, sp, #4
    STR lr, [sp]

getInputLoop:
    // Prompt the user for input
    LDR r0, =inputPrompt
    BL printf

    // Read user input into r0
    BL scanf

    // Check if the user wants to exit (-1)
    CMP r0, #-1
    BEQ exitProgram

    // Check if the input is not a positive integer
    CMP r0, #0
    BLT notPrime

    // Check if the input is less than or equal to 2, which is not prime
    CMP r0, #2
    BLE notPrime

    // Set r4 to the user's input
    MOV r4, r0

    // Initialize r6 to start dividing from 2
    MOV r6, #2

    // Continue with the prime-checking logic
startPrimeLoop:
    CMP r6, r4
    BEQ isPrime

    MOV r0, r4
    MOV r1, r6
    BL __aeabi_idivmod

    // Check if the remainder is 0
    CMP r1, #0
    BEQ notPrime

    ADD r6, r6, #1
    B startPrimeLoop

isPrime:
    // Print that the number is prime
    LDR r0, =output
    MOV r1, r4
    BL printf
    B getInputLoop

notPrime:
    // Print that the number is not prime
    LDR r0, =notPrimeMessage
    MOV r1, r4
    BL printf
    B getInputLoop

exitProgram:
    // Pop the return address from the stack and return
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
   output: .asciz "Number %d is prime\n"  // Format for printing prime numbers
   inputPrompt: .asciz "Enter a number (-1 to exit): "  // Prompt for user input
   notPrimeMessage: .asciz "Number %d is not prime\n"  // Format for printing non-prime numbers

