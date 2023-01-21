	.data
s1:	.asciiz "Three equal"
s2:	.asciiz "Three different"
s3:	.asciiz "No jump"

	.text
	.globl main
	.globl branch3equal

main:
	sub $sp, $sp, 4
	sw $ra, 0($sp)

	li $a0, 3
	li $a1, 2
	li $a2, 3
	la $a3, A1

	sub $sp, $sp, 4
	la $t0, A2
	sw $t0, 0($sp)

	jal branch3equal
	j A3

A1:
	li $v0, 4
	la $a0, s1
	syscall
	j end
A2:
	li $v0, 4
	la $a0, s2
	syscall
	j end
A3:
	li $v0, 4
	la $a0, s3
	syscall
end:
	lw $ra, 0($sp)
	add $sp, $sp, 4
	jr $ra
