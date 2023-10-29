.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   #Prompt for and read grade
   LDR r0, =prompt
   BL printf
   LDR r0, =format
   LDR r1, =grade
   BL scanf

   #print grade (grade in r0)
   LDR r0, =grade
   LDR r0, [r0]
   BL printGrades

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "\nEnter a grade between 0-100: "
   format: .asciz "%d"
   grade: .word 0

# END main



.text
printGrades:
   #push stack
   SUB sp, sp, #8
   STR lr, [sp]
   STR r4, [sp, #4]

   #store r0 in r4 for safety
   MOV r4, r0 

   #code for print grades function
   MOV r0, #0
   CMP r4, #0
   ADDGE r0, r0, #1 //if greater or equal to 0 make it true by making it 1
   MOV r1, #0
   CMP r4, #100
   #ADDLE r1, r1, #1 // if GE to 100 turn r1 to true by adding 1
   ORR r0, r0, r1 //r0 now has the value if grad is between 0 and 100

   #if test if grade is not valid
   CMP r1, #1 //if false it was not a valide grade then branch not equal to ErrorMsg
   BNE ErrorMsg  
      #otherwise enter the grade is valid block
      B EndError //if grade is valid branch to EndError
   ErrorMsg: //otherwise print error message
      #Print if grade is invalid
      LDR r0, =error
      BL printf
   EndError:

   #pop stack
   LDR lr, [sp]
   LDR r4, [sp, #4]
   ADD sp, sp, #8
   MOV pc, lr

.data
   error:   .asciz "\nGrade must be 0-100"
   grade_A: .asciz "\nGrade is A"
   grade_B: .asciz "\nGrade is B"
   grade_C: .asciz "\nGrade is C"
   Grade_F: .asciz "\nGrade is F"

