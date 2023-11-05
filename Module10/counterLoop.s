.text
.global main
main:
   # program dictionary:
   #   r4 - Loop Counter
   #   r5 - Loop Limit

   # push to stack
   SUB sp, sp, #12
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r8, [sp, #8]

   # initialize - 1
   MOV r4, #0  //move 0 into loop counter to initialize it
   MOV r5, #5  //move 5 into loop limit to say how many times to run the loop

   # start label - 2
   StartLoop:

	# check the limit - 3
	CMP r4, r5
	BGE EndLoop  // if r4 becomes greater or equal to r5 we will finish running the program

	# loop statement or block - 4  //prompt a value and print value of loop counter
	MOV r1, r4 


	# get the next value
	ADD r4, r4, #1
	LDR r0, =done //print out loop counter
	BL printf

	# branch back to start -5
	B StartLoop

   # end loop label
   EndLoop:

   # pop from stack
   LDR lr, [sp, #0]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   ADD sp, sp, #12
   MOV pc, lr

.data
   prompt: .asciz "\n Enter a number: "
   done:   .asciz "\nThe loop counter is: %d \n"
   format: .asciz "%d"
   number: .word 0
