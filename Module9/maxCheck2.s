#
# File Name: maxCheck2.s
# Author: Anna Leonardi
# Date: 10/29/2023
# Purpose: An assembly program to find the largest of 3 values
#
.global main
.text
main: 
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

#  prompt for value 1
   LDR r0, =prompt1  //load prompt in r1 to print it
   BL printf

#  read value 1 from user
   LDR r0, =format   //read format of input in r1 to read it
   LDR r1, =num1  //load input num in r1 to read it 
   BL scanf

#  prompt for value 2
   LDR r0, =prompt2  //load prompt in r2 to print it
   BL printf
   
#  read value 2 from user
   LDR r0, =format   //read format of input in r2 to read it
   LDR r1, =num2  //load input num in r2 to read it 
   BL scanf

#  prompt for value 3
   LDR r0, =prompt3  //load prompt in r3 to print it
   BL printf
   
#  read value 3 from user
   LDR r0, =format   //read format of input in r3 to read it
   LDR r1, =num3  //load input num in r3 to read it 
   BL scanf

#  call max function
   BL findMax

#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt1: .asciz "Enter a number: "
   prompt2: .asciz "Enter a second number: "
   prompt3: .asciz "Enter a third number: "
   format: .asciz "%d"
   num1: .word 0
   num2: .word 0
   num3: .word 0

#  END main



.text
findMax: 
#  Push stack
   SUB sp, sp, #4
   STR lr, [sp]

   LDR r1, =num1  //load address char to r1
   LDR r1, [r1]  //load value of char to r1
   LDR r2, =num2  //load address char to r2
   LDR r2, [r2]  //load value of char to r2
   LDR r3, =num3  //load address char to r3
   LDR r3, [r3]  //load value of char to r3

#  if block
   #check num1 <= num2
   MOV r0, #0
   CMP r1, r2  //compare num1 and num2
   BLE secondCheck  //if num1 is smaller check num2 and num3
	B firstCheck  //else check num 1 and num 3

#  check num1 <= num3
   firstCheck:
	CMP r1, r3  //compare num1 and num3
	BLE thirdCheck  //if num1 is smaller num3 is the largest
	   LDR r0, =output  //else num1 is the largest, load output in r0 
	   LDR r1, =num1  //load address of num1 in r1
	   LDR r1, [r1]  //load value of num1 in r1 to print it
	   BL printf
	   B endIf  //end if statement

#  check num2 <= num3
   secondCheck:
	CMP r2, r3  //compare num2 and num3
	BLE thirdCheck  //if num2 is smaller num3 is the largest
	   LDR r0, =output  //else num2 is the largest, load output in r0
  	   LDR r1, =num2  //load address of num2 in r1
	   LDR r1, [r1]  //load value of num2 in r1
	   BL printf
	   B endIf  //end if statement

   thirdCheck:
	LDR r0, =output  //load output to r0 to print it
	LDR r1, =num3  //load address of num3 in r1
	LDR r1, [r1]  //load value of num3 in r1
	BL printf
	B endIf  //end if statement

   endIf:

#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   output: .asciz "The largest value is: %d\n"

