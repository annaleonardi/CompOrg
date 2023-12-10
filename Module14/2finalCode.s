.data
input_prompt:   .asciz  "Enter an integer (-1 to exit): "
output_format:  .asciz  "Number of values: %d\nTotal: %d\nAverage: %f\n"

.text
.global main
.equ MAX_VALUES, 100

main:
    MOV R6, #MAX_VALUES     @ Initialize the loop counter (maximum number of values)
    MOV R4, #0             @ Initialize the total sum
    MOV R5, #0             @ Initialize the number of values entered

read_loop:
    @ Print the input prompt
    LDR R0, =input_prompt
    BL printf

    @ Read an integer from the user
    LDR R0, =MAX_VALUES
    LDR R1, =input_buffer  @ Assume input_buffer is a buffer to store the input value
    BL scanf

    @ Check if the entered value is -1 (exit condition)
    LDR R2, [R1]
    CMP R2, #-1
    BEQ exit_loop

    @ Update the total sum and number of values entered
    ADD R4, R4, R2
    ADD R5, R5, #1

    @ Continue the loop
    SUB R6, R6, #1
    BGT read_loop

exit_loop:
    @ Calculate the average
    CMP R5, #0
    BEQ skip_average
    VMOV.F32 S0, R4
    VCVT.F32.S32 S0, S0
    VMOV.F32 S1, R5
    VCVT.F32.S32 S1, S1
    VDIV.F32 S0, S0, S1
    VCVT.S32.F32 S0, S0
    VMOV R2, S0

skip_average:
    @ Print the results
    LDR R0, =output_format
    MOV R1, R5
    MOV R3, R4
    BL printf

    @ Exit the program
    MOV R7, #1
    SWI 0

.data
input_buffer:   .skip 4    @ Assuming a 32-bit integer input

