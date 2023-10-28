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
        B endLoop

            # statement or block to execute

        # GetNext value
        LDR r0, =prompt
        BL printf
        LDR r0, =format
        LDR r1, =number
        BL scanf

   endLoop:



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
