@ Program dictionary
@ r0 - user's guess
@ r1 - maximum value for the random number
@ r2 - random number generated by the computer
@ r3 - counter for the number of guesses

.text
.global main

main:
   @ Push stack
   SUB sp, sp, #12
   STR lr, [sp, #0]
   STR r3, [sp, #4]
   STR r1, [sp, #8]

   @ Prompt the user for the maximum value
   LDR r0, =max_prompt
   BL printf
   LDR r0, =input_format
   LDR r1, =max_value
   BL scanf

   @ Generate a random number (between 1 and r1)
   LDR r0, =user_guess
   BL rand
   MOV r2, r0       @ r2 contains the random number

   @ Initialize the counter
   MOV r3, #0

guess_loop:
   @ Prompt the user for a guess
   LDR r0, =guess_prompt
   BL printf
   LDR r0, =input_format
   LDR r1, =user_guess
   BL scanf

   @ Increment the guess counter
   ADD r3, r3, #1

   @ Compare the user's guess to the random number
   CMP r0, r2
   BEQ correct_guess
   BGT too_high
   BL too_low

   B guess_loop

too_high:
   @ Print "Too high" message
   LDR r0, =too_high_msg
   BL printf
   B guess_loop

too_low:
   @ Print "Too low" message
   LDR r0, =too_low_msg
   BL printf
   B guess_loop

correct_guess:
   @ Print "Congratulations" message and the number of guesses
   LDR r0, =congratulations_msg
   BL printf
   LDR r0, =guess_count_msg
   LDR r1, =user_guess
   BL printf

   @ Pop stack and exit
   LDR lr, [sp, #0]
   LDR r3, [sp, #4]
   ADD sp, sp, #12
   MOV pc, lr

.data
max_prompt: .asciz "Enter the maximum value to guess: "
guess_prompt: .asciz "Enter your guess: "
input_format: .asciz "%d"
user_guess: .word 0
max_value: .word 0
congratulations_msg: .asciz "Congratulations! You guessed the number.\n"
too_high_msg: .asciz "Too high! Try again.\n"
too_low_msg: .asciz "Too low! Try again.\n"
guess_count_msg: .asciz "Number of guesses: %d\n"
