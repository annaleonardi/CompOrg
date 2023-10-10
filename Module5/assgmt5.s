#
# Program Name: assgmt5.s
# Author: Anna Leonardi
# Date: 10/01/2023
# Purpose: Question 1 of assignment 5, converting from Celisus to Farenheight and vice versa
#
.text
.global main
main:
   #push stack
   SUB sp, sp, #4
   STR lr, [sp]

   #1 C to F

   #prompt for value
   LDR r0, =prompt1
   BL printf

   #read value from user
   LDR r0, =formatString1
   LDR r1, =celsiusStart1 //address of where celsiusStart is, not value
   BL scanf

   #do math
   LDR r0, =celsiusStart1 //address of celsiusStart in r0
   LDR r0, [r0] //store actual value of r0 which is the address of celsius Start in r0 to get the actual value
   MOV r1, #9 //to multiply by 9
   MUL r0, r0, r1 // multiplying celsius Start by 9
   MOV r1, #5 // to divide by 5
   BL __aeabi_idiv //call function for division, when we return the value  will be in r0
   MOV r4, r0 //safely put away in r4 the calculated num
   MOV r1, #32 // to add by 32 //mult value in r4 (num of hours) by 60 to get total numbers of minutes
   ADD r0, r4, r1

   #output 
   // r4 is total number of hours and r1 is total num of minutes rn
   MOV r1, r0 //freed up space to load output prompt
   LDR r0, =output1
   BL printf

   # 1 F to C

   #prompt for value
   LDR r0, =prompt2
   BL printf

   # read value from user
   LDR r0, =formatString1
   LDR r1, =farenheightStart2
   BL scanf

   #do math
   LDR r0, =farenheightStart2
   LDR r0, [r0]
   MOV r1, #32
   SUB r0, r0, r1
   MOV r1, #5
   MUL r0, r0, r1
   MOV r1, #9
   BL __aeabi_idiv
   MOV r4, r0

   #output
   MOV r1, r0
   LDR r0, =output2
   BL printf

   #pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   output1: .asciz "\nThat temperature in Farenheight is: %d\n"
   prompt1: .asciz "Enter a temperature in Celsius to convert: "
   celsiusStart1: .word 0
   formatString1: .asciz "%d"
   output2: .asciz "\nThat temperature in Celsius is: %d\n"
   prompt2: .asciz "Enter a temperature in Farenheight to convert: "
   farenheightStart2: .word 0
   formatString2: .asciz "%d"
