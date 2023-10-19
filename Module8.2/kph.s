# kph.s
# An assembly program to convert distance from miles to kilometers per hour

.text
.global main
main:
   #push the stack
   SUB sp, sp, #4
   STR lr, [sp, #0]

   #prompt for hour value
   LDR r0, =promptHours
   BL printf

   #read hours value from user
   LDR r0, =input
   LDR r1, =hours
   BL scanf

   #prompt for miles value
   LDR r0, =promptMiles
   BL printf

   #read miles value from user
   LDR r0, =input
   LDR r1, =miles
   BL scanf

   #Convert
   LDR r0, =hours
   LDR r0, [r0]
   LDR r1, =miles
   LDR r1, [r1]
   BL kph
  // MOV r2, r1
   MOV r1, r0

   #print the output
   LDR r0, =format
   BL printf

   #pop the stack
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr

.data
   promptHours: .asciz "Enter the time in hours to travel the distance by \n"
   promptMiles: .asciz "Enter the distance in miles to travel \n"
   format: .asciz "\nThe speed in kilometers per hour is: %d\n"
   input: .asciz "%d"
   hours: .word 0
   miles: .word 0

