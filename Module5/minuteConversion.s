.text
.global main
main:
   #push stack
   SUB sp, sp, #4
   STR lr, [sp]

   #prompt for value
   LDR r0, =prompt
   BL printf

   #read value from user
   LDR r0, =formatString
   LDR r1, =totalMinutes //address of where totalMinutes is not value
   BL scanf

   #do math
   LDR r0, =totalMinutes //address of totalMinutes in r0
   LDR r0, [r0] //store actual value of r0 which is the address of total minutes in r0 to get the actual value
   MOV r1, #60 // to devide by 60
   BL __aeabi_idi //call function for division, when we return the number of hours will be in r0
   MOV r4, r0 //safely put away in r4 the number of hours
   MOV r1, #60 //mult value in r4 (num of hours) by 60 to get total numbers of minutes
   MOV r0, r4
   MUL r0, r1, r4 //total num of minutes covered by the hours
   
   LDR r1, =totalMinutes // subtract total numbers of min
   LDR r1, [r1] //need value not address
   SUB r1, r1, r0 // get remaining min after hours have been accounted for

   #output min and hours
   // r4 is total number of hours and r1 is total num of minutes rn
   MOV r2, r1
   MOV r1, r4 // freed up space to load output prompt
   LDR r0, =output
   BL printf

   #pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   output: .asciz "\nHours is %d and minutes is %d\n"
   prompt: .asciz "Enter total minutes: "
   totalMinutes: .word 0 //word bit of 32 bits initialized to 0
   formatString: .asciz "%d"
