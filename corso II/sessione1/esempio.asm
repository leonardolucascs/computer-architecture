	.data
string: .asciiz "Ciao"	# Remember little-endian byte order!
	.align 2	# Aligns next element to multiple of 2^n
A:	.space 8

	.text
	.globl main
main:
	la $t0 A
	li $t1 5
	sw $t1 0($t0)
