#
# File Name: libConversions.s
# Author: Anna Leonardi
# Date: 10/21/2023
# Purpose: create a library of global conversion functions
#
.global miles2kilometer
.global kph
.global CToF
.global InchesToFt
.global miles  //declare miles global variable
.global hours  //declare hours global variable
.global num1

.text

miles2kilometer:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert miles to kilometers
   MOV r2, r0  //safely store miles into r2
   MOV r1, #161  //store 161 in r1
   MUL r0, r2, r1  //multiply miles by 161 and store in r0
   //IMPORTANT TO MULTIPLY BEFORE DIVIDING because with integer arithmetics
   // the results' decimals get truncated with division so if we multiply first we don't lose precision
   MOV r1, #100  //store 100 in r1
   BL __aeabi_idiv  //divide miles*161 in r0 by 100 in r1, result will be in r0

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   num1: .word 0
#END miles2kilometer



.text

kph:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert kilometers to kilometers per hour
   LDR r0, =miles  //load address of miles global variable to r0
   LDR r0, [r0]  //load value of miles to r0
   BL miles2kilometer  //call miles2kilometer function, miles converted to km will be in r0
   LDR r1, =hours  //load address of hours global variable in r1
   LDR r1, [r1]  //load valye of hours to r1
   BL __aeabi_idiv  //divide kilometers in r0 by hours in r1, result will be in r0

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   miles: .word 0
   hours: .word 0
#END kph



.text

CToF:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert celsius to farenheight
   MOV r4, r0  //store r0 safely in r4
   MOV r1, #5  //move 5 to r1
   MOV r6, #9  //move 0 to r6
   MUL r0, r4, r6  //multiply celsius degrees in r4 by 9 in r6
   BL __aeabi_idiv  //divide celsius*9 in r0 by 5 in r1
   MOV r3, #32  //store 32 in r3
   ADD r0, r0, r3  //add celsius*9/5 plus 31 and store in r0
   // result will be in r0

   #pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data

#End CToF



.text

InchesToFt:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #Convert inches to feet
   MOV r1, #12  //store integer 12 in r1
   BL __aeabi_idiv  //devide inches in r0 by 12 in r1, result will be in r0

   #pop the stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data

#END Ft2Inches
