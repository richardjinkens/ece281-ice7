# Draw the RISC-V Logo in VS Code with Venus Simulator
#
# The ecall function is an OS call that writes to I/O (LEDs in this case).
# The ecall takes the following arguments:
#   a0: I/O address of LED board (0x100 in the Venus simulator)
#   a1: LED pixel location: row in bits 31-16 and column in bits 15-0
#   a2: RGB color to light LED
#

# START
main:
    li a0, 0x100    # a0 is memory address of I/O for individual LED
    la s0, logo     # s0 is global ROM address for LED color values
    li s1, 0        # s1 is current LED row
    li              # s2 is current LED column
    li s3, 10       # s3 is number of LED rows/columns
light_column:
    lw a2, 0(s0)    # a2 = next RGB color value from ROM 
    slli a1, s2, 16 # a1 gets current row in bits 31-16
    or a1, a1, s1   # a1 gets current column in bits 15-0
    ecall           # Perform OS I/O to set individual led (a0 = 0x100)
    addi            # Increment color tracker by one word
    addi            # Increment row
    beq             # Done with that column, branch to next_column
                    # Not done, jump back to light_column

next_column:
    addi s2, s2, 1  # Increment current LED column
                    # all columns complete, branch to done
    li s1, 0        # Reset column to 0
    li a0, 0x100    # Reset a0 to LED board address
                    # Reset a1 to 0
                    # Jump to light_column
    
done:
    li a0, 10       # Set syscall for program exit
    ecall           # Exit the program


.data
# RBG: r in bits 23-16, g in bits 15-8 and b in bits 7-0
# This value will be loaded into a2
# 0xFFFFFFFF is White
# 0x002A3172 is Blue
# 0x00F6B21A is Yellow
logo:
    .word 0xFFFFFFFF # White
    .word 0x002A3172 # Blue
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x00F6B21A # Yellow
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0x00F6B21A
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0x002A3172
    .word 0x002A3172
    .word 0x002A3172
