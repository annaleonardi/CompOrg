#
# File Name: 2multRecr.s
# Author: Anna Leonardi
# Date: 11/12/2023
# Purpose: Q1 Module11, a program to calculate multiplication using successive addition with recursion. Eg, 5*4 is 5+5+5+5.
#

.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   # prompt and read first input M
   LDR r0, =promptM
   BL printf
   LDR r0, =format
   LDR r1, =m
   BL scanf

   # prompt and read first input N
   LDR r0, =promptN
   BL printf
   LDR r0, =format
   LDR r1, =n
   BL scanf


   # load values of two inputs in r0 and r1 to pass through the Mult fucntion
   LDR r0, =m
   LDR r0, [r0]
   LDR r1, =n
   LDR r1, [r1]
   BL Mult
   MOV r1, r0

   LDR r0, =output
   BL printf

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   promptM: .asciz "\nEnter a number to multiply: "
   promptN: .asciz "\nEnter how many times to multiply the number by: "
   output: .asciz "\nYour result is: %d\n"
   format: .asciz "%d"
   m: .word 0
   n: .word 0

# END main



.text
Mult:
   # push the stack
   SUB sp, sp, #12  //sub 4+4 because we are storing 2 parameters
   STR lr, [sp]
   STR r4, [sp, #4]
   STR r8, [sp, #8]
   
   MOV r4, r0  // safely store the input M in r4
   MOV r5, r1  // safely stoe the input N in r5
   
   # if (n==1) return r4 (M)
   CMP r5, #1  //compare M with 1
   BNE Else  // if not equal go into recursion
	MOV r0, r4
	B Return  //base case ends recursion

   # else
   Else:
	SUB r1, r5, #1  // subtract 1 from N
	BL Mult
	ADD r0, r4, r0  //store in r0 what came back from the sum program plus r4
	B Return

   Endif:  

   # pop the stack
   Return:  //put a return label
   LDR lr, [sp]
   LDR r4, [sp, #4]
   LDR r5, [sp, #8]
   ADD sp, sp, #12
   MOV pc, lr
.data

# END multiplication
