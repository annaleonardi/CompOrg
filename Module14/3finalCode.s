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

   StartSentinelLoop:
	MOV r0, #-1
	CMP r4, r0
	BEQ EndSentinelLoop

	# Input Check
	MOV r0, #0
	CMP r4, r0
	BLE ElseInvalid

	   # summation loop
	   # initialize the loop,
	   # r0 - counter
	   # r4 - loop limit
	   # r5 - sum

	   MOV r0, #0
	   MOV r5, #0

	   StartCountingLoop:
	   CMP r4, r0
	   BLT EndCountingLoop

		# Loop Block
		ADD r5, r5, r0

		# Get next value
		LDR r0, =prompt
		BL printf
		LDR r0, =input
		LDR r1, =num
		BL scanf
		LDR r6, =num
		LDR r6, [r1, #0]

		B StartCountingLoop

	   EndCountingLoop:

	   LDR r0, =output
	   MOV r1, r5
	   BL printf

	   B EndInputCheck

	ElseInvalid:

	   # Print badInput message
	   LDR r0, =badInput
	   BL printf

	EndInputCheck:

	# Get next value
	ADD r5, r5, r0

	B StartSentinelLoop

   EndSentinelLoop:

   MOV r0, #0
   LDR lr, [sp, #0]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   LDR r6, [sp, #12]
   LDR r7, [sp, #16]
   ADD sp, sp, #20
   MOV pc, lr

.data
   prompt:   .asciz "Please enter a number to sum: \n"
   badInput: .asciz "Your input value must be > 0 \n"
   output: .asciz "The summation from 1 to n is %d\n"
   input: .asciz "%d"
   num: .word 0
# End main
