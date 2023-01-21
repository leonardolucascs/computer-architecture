# Input: nessuno
# Output :
# $v0 : indirizzo dell'elemento letto, 0 se lo stack è vuoto
	.text
	.globl pop
pop:
	la $t9 stack_n
	lw $t0 0($t9)
	bne $t0 $zero __pop
	move $v0 $zero
	j pop_exit

__pop:
	la $t8 stack
	lw $v0 0($t8) # Vogliamo restituire l'indirizzo dell'elemento appena rimosso
	lw $t7 12($v0)
	subi $t0 $t0 1 # stack_n--
	sw $t7 0($t8) # aggiorna lo stack pointer al nodo successivo a quello rimosso
	sw $t0 0($t9) # aggiorna il contatore di elementi

pop_exit:
	jr $ra
