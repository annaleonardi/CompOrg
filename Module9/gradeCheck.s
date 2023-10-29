.global main
.text
main: 
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

   LDR r0, =prompt
   BL printf
   LDR r0, =format
   LDR r1, =grade
   BL scanf

   LDR r4, =grade
   LDR r4, [r4]

#  if block
   #check 0 <= r4 <= 100
   MOV r1, #0
   MOV r0, #0
   CMP r4, r0
   MOVGE r1, #1

   MOV r2, #0
   MOV r0, #100
   CMP r4, r0
   MOVLE r2, #1

   AND r1, r1, r2
   MOV r2, #1
   CMP r1, r2
   BEQ grade_A  //grade is valid

#  code block for invalid grade
   LDR r0, =Invalid
   BL printf
   B EndIf

   grade_A:
   MOV r0, #90
   CMP r4, r0
   BLT grade_B

#  code block for grade A
   LDR r0, =GradeA
   BL printf
   B EndIf

   grade_B:
   MOV r0, #80
   CMP r4, r0
   BLT grade_C

#  code block for grade B
   LDR r0, =GradeB
   BL printf
   B EndIf

   grade_C:
   MOV r0, #70
   CMP r4, r0
   BLT Else

#  code blcok for grade C
   LDR r0, =GradeC
   BL printf
   B EndIf

   Else:
#  code block for grade F
   LDR r0, =GradeF
   BL printf
   B EndIf

   EndIf:

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
