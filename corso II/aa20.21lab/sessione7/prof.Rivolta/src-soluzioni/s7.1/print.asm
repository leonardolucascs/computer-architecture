	.data
x_str :	.asciiz "x: "
y_str :	.asciiz "y: "
angle_str :	.asciiz "a: "
empty_str :	.asciiz "Stack vuoto!\n"
nl :	.asciiz "\n"
sep :	.asciiz "-----------\n"
	
	.text
	.globl stack_print
stack_print:
	la $t8 stack
	la $t9 stack_n
	
	lw $t7 0($t9)
	lw $t0 0($t8)
	
	beq $t7 0 empty_stack
	
print_loop:
	beq $t7 0 end_loop
	
	# Stampa X
	li $v0 4
	la $a0 x_str
	syscall
	li $v0 1
	lw $a0 0($t0)
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# Stampa Y
	li $v0 4
	la $a0 y_str
	syscall
	li $v0 1
	lw $a0 4($t0)
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# Stampa Angolo
	li $v0 4
	la $a0 angle_str
	syscall
	li $v0 1
	lw $a0 8($t0)
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# Stampa Separatore
	li $v0 4
	la $a0 sep
	syscall
	
	lw $t0 12($t0) # Prossimo elemento
	subi $t7 $t7 1 # Decrementa contatore
	
	j print_loop

empty_stack:
	li $v0 4
	la $a0 empty_str
	syscall
	# Stampa Separatore
	li $v0 4
	la $a0 sep
	syscall

end_loop:
	jr $ra
