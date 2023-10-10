.text
.global main
main: 
   SUB sp, sp, #4
   STR lr, [sp]

   MVN r4, #0 //move into r4 the imm 0 with the negation of it, this will make all bits in r4 be 1s
   MOV r5, #0x0000000f //put into r5 the 4 lowest level bits so it should have value 15 = lowest 4 bits are 1
   MOV r6, #1 // put a 1 into reg6 so all bits will be 0 excpet lowest order bit
   AND r1, r4, r5 //and r4 and r5 and store in r1, result in r1 will be r4 with all the bits that mask out with r5 with just the bottom 4 bits, result will be only the bottom 4 bits of r4 go into r1
   ORR r2, r1, r4 //take r4 and or with r1, all bits will be turned back on in r2
   AND r1, r2, r6 //look at lowest order bit, take r2 with all the bits on and and with r6 that has the lowest order bit on, r1 will have only the lowest bit on, all other bits will be masked out

   LDR lr, [sp]
   AND sp, sp, #4
   MOV pc, lr
.data
