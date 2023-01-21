	.data
	.globl stack
	.globl stack_n
	
stack :		.word 0 # Puntatore all'ultimo elemento inserito nello stack
stack_n:	.word 0 # Nummero di elementi attualmente nello stack
opt_str : .asciiz "\nOpzioni:\n(1) - Push\n(2) - Pop\n(3) - Print\n(4) - Exit\n>"
x_str: .asciiz "x?>"
y_str: .asciiz "y?>"
a_str: .asciiz "a?>"
.text
.globl main

main:
	
loop:
	li $v0 4
	la $a0 opt_str
	syscall		
	li $v0 5
	syscall
	
	beq $v0 1 L1
	beq $v0 2 L2
	beq $v0 3 L3
	beq $v0 4 L4
	
	j loop
	
L1:	li $v0 4
	la $a0 x_str
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	li $v0 4
	la $a0 y_str
	syscall
	li $v0 5
	syscall
	move $t1 $v0
	li $v0 4
	la $a0 a_str
	syscall
	li $v0 5
	syscall
	move $t2 $v0
	move $a0 $t0
	move $a1 $t1
	move $a2 $t2
	jal push
	
	j loop

L2:	jal pop
	j loop

L3:	jal stack_print
	j loop
	
L4:	li $v0 10		# exit()
	syscall
