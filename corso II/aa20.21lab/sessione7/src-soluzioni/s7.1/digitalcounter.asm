# ref: http://wilkinsonj.people.cofc.edu/digilab.html

	.data

# digits are represented on a 8 bit (half word) matrix
# whenever a bit in this matrix is set to 1, the corresponding
# led in the digital screen will light up
# leds are set counterclockwise

digits: .word 0x3F,0x06,0x5B,0x4F, 0x66,0x6D,0x7D,0x07, 0x7F,0x67,0x77,0x7F, 0x39,0x3F,0x79,0x71
counter: .word 16

	.text
main:
	la $t0 0xFFFF0011 # Load the address of left digit for MMIO
	la $a0, counter # Load the address of the counter
	lw $t1, 0($a0) # Store counter target value in $t1
	li $t9, 0 # i=0
	la $t2, digits # Load address of digits array

loop:
	lb $t3, 0($t2) # Get current digit byte configuration
	sb $t3, 0($t0) # Write byte at the left digit memory address
	addi $t9,$t9,1 # i++
	addi $t2,$t2,4 # move pointer on digits array

	blt $t9,$t1,loop # if (i<counter) goto loop;

	# exit
	li $v0, 10
	syscall
