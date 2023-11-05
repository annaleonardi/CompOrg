#
# Program dictionary
# r4 - counter
# r5 - number of elements / max value for loop counter
# r6 - base address of array
# r7 - the current maximum value
# r8 - value at current index
#
.text
.global main
main:
   # push stack
   SUB sp, sp, #24
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   STR r6, [sp, #12]
   STR r7, [sp, #16]
   STR r8, [sp, #20]

   # initialize - 1
   MOV r4, #0  //initialize r4 to r0
   LDR r5, =arraySize //load array size into r5
   LDR r5, [r5]  //to finish initializing r5, load into r5 what is at address r5 aka arraysize
   LDR r6, = array  //load to r6 the base address of array
   MOV r7, #-1  //smallest value for loop

   startMaxLoop:
	# check loop ending condition - 2
	CMP r4, r5
	BGE endMaxLoop

	# loop statement or block - 4
	ADD r8, r6, r4, LSL #2  //calculate new address, mult value in r4 by 4 and add that to r6, store in r8
	LDR r8, [r8]  //load value into r8 that is at address r8
	CMP r8, r7  //cmp r8 to r7
	MOVGT r7, r8  //if r8 > r7 move into r7 the value of r8

	# get next - 3
	ADD r4, r4, #1 //add 1 to loop counter

	B startMaxLoop

   endMaxLoop:

   # print out the value - 5
   LDR r0, =output
   MOV r1, r7  //move max value in r7 in r1 to print it
   BL printf

   # push stack
   LDR lr, [sp, #0]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   LDR r6, [sp, #12]
   LDR r7, [sp, #16]
   LDR r8, [sp, #20]
   ADD sp, sp, #24
   MOV pc, lr

.data
   output: .asciz "The maximum value in list is %d\n"
   array:  .word 5
	   .word 12
	   .word 8
	   .word 27
   arraySize: .word 4
