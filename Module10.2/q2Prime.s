.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp, #0]

   # initialize by prompting user, answer in r4
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

	   # Loop block
		# Input Check
		MOV r0, #2
		CMP r4, r0
		BLE ElseInvalid
		   # If block, determine if prime
		   # initialize loop,
		   # r0 - counter
		   # r4 - number from user
		   # r5 - start at 3
		   # r6 - for dividing by 2
		   # r7 - remainder
		   # r8 - end of division (num from user / 2)
		   MOV r5, #3
		   MOV r6, #2
		   MOV r7, #0
		   MOV r8, r4, LSR #1

			StartCountingLoop:
			CMP r6, r8
			BGT EndCountingLoop

			   # Loop Block
			   MOV r0, r4
			   MOV r1, r6
			   BL __aeabi_idivmod
			   MOV r7, r1

			   CMP r7, #0
			   BEQ notPrime

			   # Get next value
			   ADD r6, r6, #1

			   B StartCountingLoop

			notPrime:
			LDR r0, =NotPrime
			LDR r1, =num
			LDR r1, [r1]
			BL printf

		B EndInputCheck

			EndCountingLoop:
			LDR r0, =prime
			LDR r1, =num
			LDR r1, [r1]
			BL printf

		B EndInputCheck

			ElseInvalid:
		   	# Else block, print bad input
			LDR r0, =badInput
			LDR r1, [r1]
			BL printf

		EndInputCheck:

	   # get next value
	   LDR r0, =prompt
	   BL printf
	   LDR r0, =input
	   LDR r1, =num
	   BL scanf
	   LDR r1, =num
	   LDR r4, [r1, #0]

	   B StartSentinelLoop

   EndSentinelLoop:

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
   # End main

.data
   prompt: .asciz "Please enter a number (-1 to end) \n"
   prime:  .asciz "Number %d is prime\n\n"
   NotPrime: .asciz "Number %d is NOT prime\n\n"
   badInput: .asciz "The number you entered in not valid\n\n"
   input:  .asciz "%d"
   num:    .word 0
