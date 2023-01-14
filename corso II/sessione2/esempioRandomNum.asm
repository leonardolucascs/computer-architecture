# Generate random number [10, 14]
	.text
	.globl main
	
main:
	
	li $a0 1012021	# seed generator, is not the lower bound
	
	li $a1 5	# upper bound, excluded

	li $v0 42	# syscall generate int range
	syscall
	
	addi $a0 $a0 10	# add the lower bound
	
	li $v0 1
	syscall
	
	li $v0 10
	syscall
