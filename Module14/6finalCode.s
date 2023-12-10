#
# File Name: 6finalCode.s
# Author: Anna Leonardi
# Date: 10/12/2023
# Purpose: An assembly program add the inputs provided by user, and print the sum, number of inputs, and average
#
.text
.global main
main:
   SUB sp, sp, #20
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   STR r6, [sp, #12]
   STR r7, [sp, #16]

   # initialize by prompting user, answer in r4
   LDR r0, =prompt
   BL printf

   LDR r0, =input
   LDR r1, =num
   BL scanf

   LDR r4, =num
   LDR r4, [r4, #0]

   MOV r5, #0  // Sum of values
   MOV r6, #0  // Count of inputs

   StartSentinelLoop:
	MOV r0, #-1
	CMP r4, r0
	BEQ EndSentinelLoop

	# Input Check
	MOV r0, #0
	CMP r4, r0
	BLE ElseInvalid

	   # summation loop
	   # r4 - loop limit
	   # r5 - sum

	   MOV r0, #0

	   StartCountingLoop:
	   CMP r4, r0
	   BLT EndCountingLoop

		# Loop Block
		ADD r5, r5, r4
		ADD r6, r6, #1  // Increment the count

		# Get next value
		LDR r0, =prompt
		BL printf
		LDR r0, =input
		LDR r1, =num
		BL scanf
		LDR r4, =num
		LDR r4, [r4, #0]

		B StartCountingLoop

	   EndCountingLoop:

	   B EndInputCheck

	ElseInvalid:

	   # Print badInput message
	   LDR r0, =badInput
	   BL printf

	EndInputCheck:

	# Get next value
	LDR r0, =prompt
	BL printf
	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r4, =num
	LDR r4, [r4, #0]

	B StartSentinelLoop

   EndSentinelLoop:

   LDR r0, =output
   MOV r1, r5
   BL printf

   LDR r0, =countOutput
   MOV r1, r6
   BL printf

   MOV r0, r5
   MOV r1, r6
   BL __aeabi_idiv
   MOV r1, r0
   LDR r0, =avg
   BL printf

   MOV r0, #0
   LDR lr, [sp, #0]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   LDR r6, [sp, #12]
   LDR r7, [sp, #16]
   ADD sp, sp, #20
   MOV pc, lr

.data
   prompt:      .asciz "Please enter a number to sum (enter -1 to finish): \n"
   badInput:    .asciz "Your input value must be >= -1 \n"
   output:      .asciz "The summation is %d\n"
   avg: 	.asciz "The average is %d\n"
   countOutput: .asciz "Number of inputs provided: %d\n"
   input:       .asciz "%d"
   num:         .word 0
# End main

