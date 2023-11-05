.text
.global main

.equ MAX_N, 100  // Maximum value of 'n' (change as needed)

main:
    SUB sp, sp, #12  // Allocate space on the stack
    STR lr, [sp, #4]  // Save the return address

    // Prompt the user for the value of 'n'
    LDR r0, =input_prompt
    BL printf
    LDR r0, =user_input
    LDR r1, =buffer
    LDR r2, =buffer_size
    BL fgets

    // Convert the user input to an integer
    LDR r0, =user_input
    LDR r1, =conversion_format
    LDR r2, =n
    BL sscanf

    LDR r4, =n  // Load the user input into r4

    // Check if the input is less than 3, and set it to 3 if it is.
    CMP r4, #3
    BLT set_to_3
    B primeLoop

set_to_3:
    MOV r4, #3

primeLoop:
    LDR r5, =MAX_N  // Load the maximum value of 'n' (change as needed)
    CMP r4, r5  // Compare r4 (current number) with r5 (maximum 'n')
    BGT endProgram  // If r4 > r5, exit the program

    MOV r6, #2  // Initialize r6 to start dividing from 2
    MOV r7, #0  // Initialize r7 to store the remainder

    divideLoop:
        CMP r6, r4, LSR #1  // Compare r6 with r4/2
        BGT isPrime  // If r6 > r4/2, it's prime, so proceed to isPrime

        MOV r0, r4
        MOV r1, r6
        BL __aeabi_idivmod  // Call __aeabi_idivmod to perform division and get the remainder
        MOV r7, r1  // Get the remainder from r1

        CMP r7, #0  // Compare the remainder with 0
        BEQ notPrime  // If remainder is 0, the number is not prime

        ADD r6, r6, #1  // Increment r6 for the next division
        B divideLoop  // Repeat the division

    isPrime:
        // Print the prime number
        LDR r0, =output
        MOV r1, r4
        BL printf

    notPrime:
        ADD r4, r4, #2  // Increment r4 by 2 to check the next odd number
        MOV r6, #2  // Reset r6 to 2 for the next number
        B primeLoop  // Repeat the prime check

endProgram:
    LDR lr, [sp, #4]  // Restore the return address
    ADD sp, sp, #12  // Deallocate the stack space
    MOV pc, lr  // Return from the program

.data
output: .asciz "%d, "  // Format for printing prime numbers
input_prompt: .asciz "Enter the value of 'n': "
user_input: .space 10
buffer: .space 10
buffer_size: .word 10
conversion_format: .asciz "%d"  // Format for sscanf
n: .word 0

