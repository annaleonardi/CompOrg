.text
.global main
main:
   SUB sp, sp, #4
   STR lr, [sp]

   MOV r4, #5
   LSL r5, r4, #2 //shift left by 2 positions to multiply by 4

   #multiply r4 which is 5 by 9, 8+1 = 9 which is a 2 shift and a 1 shift
   LSL r5, r4, #3 //shift value in r4 into r5 by 3 bits, this is mult by 8 gives me 40
   ADD r5, r5, #5 //add 5 to r5 to get 45 which is 9 * 9

   # devide 7 by 3 and -7 by 3
   MOV r4, #7 // move into r4 the value of 7
   ASR r5, r4, #1  //shift right by 1 bit to do division by 2, use arithmatic shift to maintain sign, will get 3.5 truncated to 3

   MOV r4, #-7
   ASR r5, r4, #1 //will have -4 in r5, when truncation occurs we go to the next lowest value

   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
