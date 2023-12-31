# Correct code from lecture 9 example
# Initialize: 		inputValue = get input from user
# StartLabel: 		startLoop:
# Condition Check: 		if (inputValue == -1) branch endLoop
# Statement if trye: 		print inputValue
# Get Next Value: 		inputValue = get input from user
# Branch to start label: 	branch startLoop
# End label: 		endLoop:

.global main
.text
main: 
#   Push stack
   SUB sp, sp, #4
   STR lr, [sp]

#   Sentiel Loop
#   Initialize:			inputValue = get input from user
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =number
    BL scanf

# StartLabel:
    startLoop:
        LDR r1, =number
        LDR r1, [r1]

        CMP r1, #-1
        BEQ endLoop

            # statement or block to execute
            MOV r3, #0
            CMP r1, #0 
            ADDGT r3, r3, #1  //if r1 greater than 0 r3 will become 1

            MOV r4, #0
	    CMP r1, #100
	    ADDLT r4, r4, #1
	    AND r0, r3, r4 //will give logical value wether it is between 0 and 100

	    CMP r0, #1
      	    BNE elseError //if not true
		LDR r0, =output
		BL printf

		B endError //ALWAYS put at end of if or elseif a branch to endError

   	    elseError:
		LDR r0, =error
		BL printf
 
 	    endError:

        # GetNext value
        LDR r0, =prompt
        BL printf
        LDR r0, =format
        LDR r1, =number
        BL scanf
        B startLoop //go back to start of loop

   endLoop:
	LDR r0, =ending
	BL printf

#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "\nEnter a number, -1 to quit: "
   number: .word 0
   format: .asciz "%d"
   output: .asciz "\nYou entered %d"
   ending: .asciz "\nThe program is done"

# END main
