	.data
string1: .asciiz "Inserire N: "
string2: .asciiz "Il fattoriale di N è: "
string3: .asciiz "\nl' N-esimo numero di fibonacci è: "

	.text
	.globl main
main:
	li $v0 4
	la $a0 string1
	syscall
	
	li $v0 5
	syscall
	move $s0 $v0 # s0<-N
	
	move $a0 $s0
	jal fattoriale
	move $s1 $v0

	move $a0 $s0
	jal fibonacci
	move $s2 $v0

	li $v0 4
	la $a0 string2
	syscall

	li $v0 1
	move $a0 $s1
	syscall

	li $v0 4
	la $a0 string3
	syscall

	li $v0 1
	move $a0 $s2
	syscall
	
	# exit
	li $v0 10
	syscall