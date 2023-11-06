.text
.global main

main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

inputLoop:
    LDR r0, =prompt
    BL printf
    LDR r0, =input
    LDR r1, =num
    BL scanf
    LDR r1, =num
    LDR r4, [r1, #0]

    CMP r4, #-1
    BEQ endProgram

    CMP r4, #2
    BLE invalidInput

    MOV r5, #2  // r5 will be used as a counter for divisors

primeLoop:
    CMP r5, r4
    BEQ isPrime

    MOV r0, r4
    MOV r1, r5
    BL checkDivisibility

    CMP r0, #0
    BEQ notPrime

    ADD r5, r5, #1
    B primeLoop

checkDivisibility:
    MOV r6, r0
    MOV r7, r1
    MOV r0, r6
    MOV r1, r7
    MOV r2, #0
    BL __aeabi_idivmod
    MOV r0, r1
    BX lr

isPrime:
    LDR r0, =primeMsg
    MOV r1, r4
    BL printf
    B inputLoop

notPrime:
    LDR r0, =notPrimeMsg
    MOV r1, r4
    BL printf
    B inputLoop

invalidInput:
    LDR r0, =badInput
    BL printf
    B inputLoop

endProgram:
    MOV r0, #0
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
prompt: .asciz "Please enter a number (-1 to exit): "
badInput: .asciz "Invalid input. Enter a number greater than 2 or -1.\n"
primeMsg: .asciz "Number %d is prime.\n"
notPrimeMsg: .asciz "Number %d is not prime.\n"
input: .asciz "%d"
num: .word 0

