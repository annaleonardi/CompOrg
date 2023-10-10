#
# Program Name: assignment4.s
# Author: Anna Leonardi
# Date: 9/24/2023
# Purpose: questions 1, 2, 3, 5 (extra credit) for module 4 including 
	# 1 - Ask a user for their age, and output it.
	# 2 - Output a string with tabs between the number you output and the characters before and after it.
	# 3 - Put quotes in a formated string.
	#5 - Extra Credit - Input a floating point and print it out of the program.  Note: the %f that scanf uses is a float (32 bits), and the %f that printf uses is a double (64 bits). 
#

.text
.global main

main:

   # Save return to OS on stack 
   SUB sp, sp, #4
   STR lr, [sp, #0]

   # Prompt for an input 1
   LDR r0, =prompt1
   BL printf


   # Scan the message 1
   LDR r0, =input1
   LDR r1, =num1
   BL scanf

   # Printing the message 1
   LDR r0, =format1
   LDR r1, =num1
   LDR r1, [r1, #0]
   BL printf

   # Print a string 2
   LDR r0, =string2
   BL printf

   # Prompt for an input string 3
   LDR r0, =prompt3
   BL printf

   #Scan the message 3
   LDR r0, =input3
   LDR r1, =word3
   BL scanf

   # Print the miessage 3
   LDR r0, =format3
   LDR r1, =word3
   BL printf 

   # Prompt for an input 5
   LDR r0, =prompt5
   BL printf

   # Scan the message 5
   LDR r0, =input5
   LDR r1, =float5
   BL scanf

   # Convert 32 bit float from Scanf to 64 bit double for printf
   VCVT.F64.F32 d0, s0 
  
   # Print the message 5
   LDR r0, =format5
   VMOV r1, r2, d0
   BL printf

   # Return to the OS 
   LDR lr, [sp, #0]
   ADD sp, sp, #4 
   MOV pc, lr

.data
   # Prompt the user to enter age
   prompt1: .asciz "Enter your age: "

   # Format of the user input, %d means integer number
   input1: .asciz "%d"

   # Allocates space for a word-aligned 4-byte value in the memory
   num1: .word 0

   # Stores the decimal to be printed
   format1: .asciz "Your age is: %d \n"

   # Stores the string to be printed
   string2: .asciz "This is my output number	123	which is the correct answer\n"

   # Prompt the user to enter a string
   prompt3: .asciz "Enter a string of your choosing: "

   # Format for user input, %s means string
   input3: .asciz "%s"

   # Reserves space in the memory for string input
   word3: .space 40

   # Format of the output string
   format3: .asciz "Here is your string: \"%s\" \n"

   # Prompt the user to enter a floating point number
   prompt5: .asciz "Enter a floating point number: "

   # Format of the user input, %f means floating point number
   input5: .asciz "%f"

   # Allocates the space for a word-aligned value in the memory
   float5: .word 0

   # Format to print the entered floating point number
   format5: .asciz "Your floating point number is: %f \n"
