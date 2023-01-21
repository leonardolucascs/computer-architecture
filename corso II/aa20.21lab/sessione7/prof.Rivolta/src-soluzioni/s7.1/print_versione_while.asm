	.data
x_str: .asciiz "x: "
y_str: .asciiz "y: "
a_str: .asciiz "a: "
nl:    .asciiz "\n"
empty: .asciiz "Stack vuoto\n"
sep:   .asciiz "-----------\n"

	.text
	.globl print
	
print:
	la $t0 stack
	lw $t1 0($t0)  # puntatore allo stack
	
	beq $t1 $zero stack_vuoto
	
loop:
	beq $t1 $zero end
	# X
	li $v0 4
	la $a0 x_str
	syscall
	li $v0 1
	lw $a0 0($t1) 
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# Y
	li $v0 4
	la $a0 y_str
	syscall
	li $v0 1
	lw $a0 4($t1) 
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# A
	li $v0 4
	la $a0 a_str
	syscall
	li $v0 1
	lw $a0 8($t1) 
	syscall
	li $v0 4
	la $a0 nl
	syscall
	# separatore
	li $v0 4
	la $a0 sep
	syscall

	# passo al prossimo elemento
	# elem = elem.next
	lw $t1 12($t1)
	
	j loop

stack_vuoto:
	li $v0 4
	la $a0 empty
	syscall
	
end:
	jr $ra
	