# Inserisce un elemento nello stack
# Input :
# a0 : x
# a1 : y 
# a2 : angolo a
# Output: nessuno
	.text
	.globl push
push:
	move $t0 $a0
	move $t1 $a1
	move $t2 $a2

	la $t8 stack
	lw $t7 0($t8)
	la $t9 stack_n

	li $a0 16 # malloc(4*4 bytes)
	li $v0 9
	syscall
	
	sw $t0 0($v0) # inizializza nuovo nodo
	sw $t1 4($v0)
	sw $t2 8($v0)
	sw $t7 12($v0) # next = *old_stack
	
	lw $t3 0($t9) # stack_n++
	addi $t3 $t3 1
	
	sw $v0 0($t8) # aggiorna lo stack pointer al nodo appena creato
	sw $t3 0($t9) # aggiorna il contatore di elementi
	
	jr $ra # ritorna al chiamante
