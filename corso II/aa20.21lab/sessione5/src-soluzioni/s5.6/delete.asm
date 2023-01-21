# INPUT:
# $a0 base address lista
# $a1 base address variabile head
# $a2 indice elemento da eliminare
# $a3 numero di elementi nell'array

	.text
	.globl delete
delete:
	mul $t0 $a2 4  # offset
	add $t0 $a0 $t0 # indirizzo el da eliminare

	sub $t1 $a3 $a2
	sub $t1 $t1 1 # $t1=numero di scritture da effettuare per compattare l'array

	blt $t1 $zero err
loop:
	beq $t1 $zero exitLoop
	lw $t2 4($t0)
	sw $t2 0($t0)
	add $t0 $t0 4
	sub $t1 $t1 1
	j loop

exitLoop:
	# aggiorno head
	lw $t0 0($a1) # indirizzo head
	sub $t0 $t0 4
	sw $t0 0($a1)
	j end

err:
	li $v0 1
	jr $ra
end:	
	li $v0 0
	jr $ra
