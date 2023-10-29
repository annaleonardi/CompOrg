#
# File Name: gradeCheck.s
# Author: Anna Leonardi
# Date: 10/29/2023
# Purpose: An assembly program to calculate letter grade from numerical grade input
#
.global main
.text
main: 
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

#  prompt for value
   LDR r0, =prompt  //load prompt in r0 to print it
   BL printf

#  read value  from user
   LDR r0, =format  //road format of input in r0 to read it
   LDR r1, =grade  //load input grade in r1 to read it 
   BL scanf

   LDR r4, =grade  //load address of grade to r4
   LDR r4, [r4]  //load value of grade to r4

#  if block (input in r4)
   #check 0 <= r4
   MOV r1, #0  //initalize r1 to false
   MOV r0, #0  //initiaize r0 to 0
   CMP r4, r0  //compare if r4 >= r0
   MOVGE r1, #1  //if true make r1 true

#  check r4 <= 100
   MOV r2, #0  //initialize r2 to false
   MOV r0, #100  //initialize r0 to 100
   CMP r4, r0  //compare if r4 <= 100
   MOVLE r2, #1  //if true make r2 true

   AND r1, r1, r2  //check that both r1 and r2 are true and store in r1
   MOV r2, #1  //initialize r2 to true
   CMP r1, r2  //compare r1 to r2 to see if true
   BEQ grade_A  //if true grade is valid otherwise is invalid

#  code block for invalid grade
   LDR r0, =Invalid  //load invalid output to r0 to print it
   BL printf
   B EndIf  //end if statement

   grade_A:
   MOV r0, #90  //initalize r0 to 90
   CMP r4, r0  //compare input with 90
   BLT grade_B  //if less than 90 branch to B grade

#  code block for grade A
   LDR r0, =GradeA  //else it is A grade, load output to r0 to print it
   BL printf
   B EndIf  //end if statement

   grade_B:
   MOV r0, #80  //initialize r0 to 80
   CMP r4, r0  //compare input with 80
   BLT grade_C  //if less than 80 branch to C grade

#  code block for grade B
   LDR r0, =GradeB  //else it is a B grade, load output to r0 to print it
   BL printf
   B EndIf  //end if statement

   grade_C:
   MOV r0, #70  //initialize r0 to 70
   CMP r4, r0  //compare input with 70
   BLT Else  //if less than 70 branch to else F grade statement

#  code blcok for grade C
   LDR r0, =GradeC  //else it is a C grade, load output to r0 to print it
   BL printf
   B EndIf  //end if statement

   Else:
#  code block for grade F
   LDR r0, =GradeF  //else it is an F grade, load output to r0 to print it
   BL printf
   B EndIf  //end if statement

   EndIf:  //end of if lop

#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   GradeA: .asciz "Grade is A\n"
   GradeB: .asciz "Grade is B\n"
   GradeC: .asciz "Grade is C\n"
   GradeF: .asciz "Grade is F\n"
   Invalid: .asciz "Grade must be bewteeen 0 and 100 \n"
   prompt: .asciz "\nEnter a number: "
   grade: .word 0
   format: .asciz "%d"
