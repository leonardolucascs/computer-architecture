# INPUT:
# $a0 e $a1 due interi positivi
# OUTPUT:
# il loro prodotto ottenuto con ripetute chiamate alla procedura somma

	.text
	.globl prodotto_s

prodotto_s:
	sub $sp $sp 16
	# salvo $ra perchè dovrò chiamare un'altra procedura
	sw $ra 8($sp)
	# salvo s0 s1 s2 mi serviranno per tenere traccia delle somme
	sw $s0 4($sp)
	sw $s1 0($sp)
	sw $s2 0($sp)

	move $s0 $a0
	move $s1 $a1

	# voglio in $s0 quello <= (minimizzo numero di iterazioni)
	blt $s0 $s1 sums
	# scambio
	move $t0 $s0
	move $s0 $s1
	move $s1 $t0
	li $s2 0 # s2 <- somma parziale
sums:
	beq $s0 $zero end
	
	# ad ogni iterazione faccio somma_parziale=somma=parziale + s1
	move $a0 $s2
	move $a1 $s1
	jal somma
	move $s2 $v0	

	sub $s0 $s0 1
	j sums

end:
	move $v0 $s2

	# ripristino registri
	lw $ra 8($sp)
	lw $s0 4($sp)
	lw $s1 0($sp)
	lw $s2 0($sp)
	add $sp $sp 16

	jr $ra