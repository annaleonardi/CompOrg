.text
.global main

# Function to check if a number is prime
IsPrime:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # r0 - number to check
    # r1 - loop counter
    # r2 - result (1 if prime, 0 if not)

    MOV r2, #1    @ Assume the number is prime
    MOV r1, #2    @ Start the loop counter at 2

    Loop:
    CMP r1, r0
    BEQ EndLoop

    MOV r3, #0
    MOV r4, #0

    LDR r3, =r1
    LDR r4, =r0
    BL __aeabi_idiv

    CMP r4, #0
    BEQ IsNotPrime

    ADD r1, r1, #1
    B Loop

    IsNotPrime:
    MOV r2, #0    @ Mark the number as not prime

    EndLoop:
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # initialize by prompting the user, answer in r4
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r4, [r1, #0]

    StartSentinelLoop:
    MOV r0, #-1
    CMP r4, r0
    BEQ EndSentinelLoop

    # Input Check
    MOV r0, #0
    CMP r4, r0
    BLE ElseInvalid

    # Check if the input number is prime
    BL IsPrime
    CMP r2, #1    @ Check the result of IsPrime function
    BEQ Prime
    B NotPrime

    Prime:
    LDR r0, =primeOutput
    BL printf
    B EndInputCheck

    NotPrime:
    LDR r0, =notPrimeOutput
    BL printf
    B EndInputCheck

    ElseInvalid:
    # Print badInput message
    LDR r0, =badInput
    BL printf

    EndInputCheck:

    # Get the next value
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r4, [r1, #0]

    B StartSentinelLoop

    EndSentinelLoop:

    MOV r0, #0
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
prompt: .asciz "Please enter the number to check for primality or -1 to exit\n"
badInput: .asciz "Your input value must be > 0 \n"
primeOutput: .asciz "%d is a prime number\n"
notPrimeOutput: .asciz "%d is not a prime number\n"
input: .asciz "%d"
num: .word 0

