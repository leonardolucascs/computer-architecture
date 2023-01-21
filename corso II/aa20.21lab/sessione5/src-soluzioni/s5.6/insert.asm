# INPUT:
# $a0 address variabile head
# $a1 elemento da inserire

	.text
	.globl insert
insert:
	lw $t0 0($a0) # $t0 = address head
	sw $a1 0($t0) # store nuovo elemento
	add $t0 $t0 4 # aggiorno head
	sw $t0 0($a0)
	jr $ra
