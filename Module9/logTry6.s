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
    LDR r1, =char
    BL scanf

# StartLabel:
        LDR r1, =char
	MOV r8, r1

            # statement or block to execute
            MOV r3, #0
            CMP r1, #'A'
            ADDGT r3, r3, #1  //if r1 greater than A r3 will become 1

            MOV r4, #0
	    CMP r1, #'z'
	    ADDLT r4, r4, #1

	    AND r0, r3, r4 //will give logical value wether it is between A and z

	    CMP r0, #1
      	    BNE elseError //if not true
		LDR r0, =output
		BL printf

		B endError //ALWAYS put at end of if or elseif a branch to endError

   	    elseError:
		LDR r0, =error
		BL printf
 
 	    endError:
#  Pop stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr

.data
   prompt: .asciz "\nEnter any character, to quit: "
   char: .space 40
   format: .asciz "%s"
   output: .asciz "\nYou entered %s, a valid character"
   ending: .asciz "\nThe program is done"

# END main
