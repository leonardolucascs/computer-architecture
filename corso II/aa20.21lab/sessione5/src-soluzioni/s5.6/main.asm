	.data
	.align 2
head:	.word 0
list: 	.space 512

err_msg: .asciiz "ERRORE!"

	.text
	.globl main
main:
	# inizializzo head 
	la $t0 list
	la $t1 head
	sw $t0 0($t1)

	# conto elementi in $s0
	li $s0 0

	# inserisco 3 elementi
	la $a0 head
	li $a1 22
	jal insert
	add $s0 $s0 1

	la $a0 head
	li $a1 33
	jal insert
	add $s0 $s0 1

	la $a0 head
	li $a1 44
	jal insert
	add $s0 $s0 1

	# cancello il secondo elemento
	la $a0 list
	la $a1 head
	li $a2 1
	move $a3 $s0
	jal delete
	sub $s0 $s0 1

	# inserisco un altro elemento
	la $a0 head
	li $a1 55
	jal insert
	add $s0 $s0 1
	
	# exit
	li $v0 10
	syscall
