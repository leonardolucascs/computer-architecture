	.data
str1: .asciiz "Inserire un intero: "

	.text
	.globl main
main:

	li $v0 4 # print_string
	la $a0 str1
	syscall
	
	li $v0 5 # read_int
	syscall
	add $s0 $zero $v0
	
	addi $t0 $zero 2 # carico 2 in $t0
	div $s0 $t0
	mfhi $t1
	addi $s0 $s0 1 
	bne $t1 $zero end
	addi $s0 $s0 1 # se resto è zero aggiungi ancora 1
end:
	li $v0 1 # print_int
	move $a0 $s0
	syscall
	
	li $v0 10 # exit
	syscall
