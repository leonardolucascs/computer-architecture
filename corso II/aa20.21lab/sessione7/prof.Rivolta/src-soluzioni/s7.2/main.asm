	.data
v: .word 1 1 1 

	.text
	.globl main
	
main:
	la $s0 v
	
	move $a0 $s0
	jal print_all
	
	move $a0 $s0
	li $a1 2
	jal push_back
	move $s0 $v0
	
	move $a0 $s0
	jal print_all
	
	move $a0 $s0
	li $a1 3
	jal push_back
	move $s0 $v0
	move $a0 $s0
	jal print_all
	move $a0 $s0
	
	li $a1 4
	jal push_back
	move $s0 $v0
	
	move $a0 $s0
	jal print_all
	
	
	li $v0 10
	syscall
	
	
