	.text
	.globl main

main:
	# inizializzo (primo intero)
	li $s0 3 # tengo in $s0 la somma parziale, inizializzo a 3 (1*3)

	# secondo intero
	addi $sp $sp -4	# faccio spazio sullo stack
	sw $s0 0($sp) # salvo $s0 sullo stack (push)
	li $s0 2
	li $t0 3
	mult $s0 $t0
	mflo $t0 # $t0<-2*3
	lw $s0 0($sp) # leggo dallo stack
	addi $sp $sp 4 # aggiorno lo stack pointer (pop)
	add $s0 $s0 $t0 # incremento la somma corrente

	# terzo intero
	addi $sp $sp -4	# faccio spazio sullo stack
	sw $s0 0($sp) # salvo $s0 sullo stack (push)
	li $s0 3
	li $t0 3
	mult $s0 $t0
	mflo $t0 # $t0<-3*3
	lw $s0 0($sp) # leggo dallo stack
	addi $sp $sp 4 # aggiorno lo stack pointer (pop)
	add $s0 $s0 $t0

	li $v0 10 # exit
	syscall
