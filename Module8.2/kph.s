#
# File Name: kph.s
# Author: Anna Leonardi
# Date: 10/21/2023
# Purpose: An assembly program to convert distance from miles to kilometers per hour
#

.text
.global main
main:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #prompt for hour value
   LDR r0, =promptHours  //load hours input into r0 to print it
   BL printf  //print hours input prompt from r0

   #read hours value from user
   LDR r0, =input  //load input value into r0
   LDR r1, =hours  //load hours global variable into r1
   BL scanf  //read inputs

   #prompt for miles value
   LDR r0, =promptMiles  //load hours input into r0 to print it
   BL printf  //print miles input prompt from r0

   #read miles value from user
   LDR r0, =input  //load input value into r0
   LDR r1, =miles  //load miles global variable into r1
   BL scanf  //read inputs

   #Convert
   LDR r0, =miles  //load address of miles global variable
   LDR r0, [r0]  //load value of r0 to r0
   LDR r1, =hours  //load address of hours global variable
   LDR r1, [r1]  //load value of r1 to r1
   BL kph  //call kilometers per hours function
   MOV r1, r0  //store r0 safely into r1

   #print the output
   LDR r0, =format  //load format string into r0
   BL printf  //print format string in r0 with converted value in r1

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   promptHours: .asciz "Enter the time in hours to travel the distance by \n"
   promptMiles: .asciz "Enter the distance in miles to travel \n"
   format: .asciz "\nThe speed in kilometers per hour is: %d\n"
   input: .asciz "%d"

