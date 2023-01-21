# INPUT:
# $a0 = base address dell'array
# $a1 = indice del primo e
# $a2 = indice del secondo el

# OUTPUT:
# Scambia i due elementi nell'array in memoria

	.text
	.globl swap
swap:
	# carico il primo elemento t1
	mul $t0 $a1 4
	add $t0 $a0 $t0
	lw $t1 0($t0)

	# carico il secondo elemento in t3
	mul $t2 $a2 4
	add $t2 $a0 $t2
	lw $t3 0($t2)

	sw $t1 0($t2) # store primo all'indirizzo del secondo
	sw $t3 0($t0) # store secondo all'indirizzo del primo

	jr $ra