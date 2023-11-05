.text
.global main
main:

   #
   # program dictionary:
   # r4 - counter for grade loop
   # r5 - limit for grade loop
   # r6 - total student score
   # r7 - average student score
   # r8 - student letter grade
   # r9 - student name
   # student name
   # Note: sentinel loop input (to -1) is kept in register r0 as its value is short lived
   #

   # push stack
   SUB sp, sp, #28
   STR lr, [sp, #0]
   STR r4, [sp, #4]
   STR r5, [sp, #8]
   STR r6, [sp, #12]
   STR r7, [sp, #16]
   STR r8, [sp, #20]
   STR r9, [sp, #28]

   # program goes here

   ### sentinel control loop - 1
   # initialize the loop
   # prompt user and read input
   LDR r0, =promptCont  //initialize loop by loading into r0 to continue the loop
   BL printf  //print prompt
   LDR r0, =decFormat  //read value
   LDR r1, =continue  //read into value continue
   BL scanf

   startSentinelLoop:
	LDR r1, =continue
	LDR r1, [r1]

	# check
	CMP r1, #-1
	BEQ endSentinelLoop

	# loop block or statement
	LDR r0, =promptName
	BL printf
	LDR r0, =nameFormat
	LDR r1, =name
	BL scanf

	### counter control loop - 2
	#initialize the grade loop
	MOV r4, #0  //move 0 into loop counter
	MOV r5, #5  //we will read 5 grades for each students
	MOV r6, #0  //need to reinitalize score across all students so it resets per student

	startGradeLoop:
	   # check exit condition
	   CMP r4, r5
	   BGE endGradeLoop //when r4 >= r5 end loop

	   # loop block or statement, if value is F aka not between 0 and 100, reduce the value of r4
		#prompt and read grade
		LDR r0, =promptGrade
		BL printf
		LDR r0, =scoreFormat
		LDR r1, =grade
		BL scanf
		LDR r0, =grade //will only use it for this if test
		LDR r0, [r0]

		# check if grade is between 0 and 100, use r1 and r2 as logical variables
		MOV r1, #0  //initalize r1 to false
		CMP r0, #0  //compare grade to 0
		ADDGE r1, r1, #1   //if >= to 0 make r1 true
		MOV r2, #0
		CMP r0, #100
		ADDLE r2, r2, #1
		AND r1, r1, r2  //r1 tells us if it is a valid grade

		# check grade
		CMP r1, #0
		BEQ errorGrade  //if not valid branch to error grade
		   ADD r6, r6, r0 //if grade is valid, add to r6 the current score in r0
		   B endError

		errorGrade:
		   LDR r0, =error
		   BL printf
		   SUB r4, r4, #1  //when we add 1 to r4 later we will still process another record by subtracting 1 from here to still be able to process 5 records (is part of check of valid grade)

		endError:

	   # get next
	   ADD r4, r4, #1

	   B startGradeLoop

	endGradeLoop:

	   ### calculate average
	   MOV r0, r6  //total score in r0
	   MOV r1, #5
	   BL __aeabi_idiv  //divide total score by 5
	   MOV r7, r0  //move average in r7

	   # if test for grade
	   CMP r7, #90
	   BLT GradeB
		LDR r8, =A
		B endGetGrade
	   GradeB:
	   CMP r7, #80
	   BLT GradeC
		LDR r8, =B
		B endGetGrade
	   GradeC:
	   CMP r7, #70
	   BLT GradeF
		LDR r8, =C
		B endGetGrade
	   GradeF:
		LDR r8, =F
		B endGetGrade
	   endGetGrade:

	   # print the results
	   LDR r0, =gradeOutput
	   MOV r1, r9  //name
	   MOV r2, r7  //average
	   MOV r3, r8  //grade
	   BL printf

	# get next value
	LDR r0, =promptCont
	BL printf
	LDR r0, =decFormat
	LDR r1, =continue
	BL scanf
	B startSentinelLoop  //branch back to sentinel loop

#   # get next
#   ADD r1, r1, #1

#   B startSentinelLoop

   endSentinelLoop:

   # pop stack
   LDR lr, [sp, #0]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   LDR r6, [sp, #12]
   LDR r7, [sp, #16]
   LDR r8, [sp, #20]
   LDR r9, [sp, #28]
   ADD sp, sp, #28
   MOV pc, lr

.data
   promptCont: 	.asciz "\nEnter -1 to end the program, any other key to continue: "
   promptName: 	.asciz "\nPlease enter the student's name: "
   promptGrade: .asciz "\nPlease enter a score for the student: "
   nameFormat:	.asciz "%s"
   scoreFormat: .asciz "%d"
   decFormat: 	.asciz "%d"
   grade: 	.word 0
   continue: 	.word 0
   name: 	.space 50
   gradeOutput: .asciz "\nStudent %s had an average of %d and a grade of %s\n"
   A: 		.asciz "A"
   B: 		.asciz "B"
   C: 		.asciz "C"
   F: 		.asciz "F"

#END main

   
