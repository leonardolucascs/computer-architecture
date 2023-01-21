# INPUT:
# $a0 = base address dell'array
# $a1 = numero di elementi nell'array
# OUTPUT:
# $v0: indice del massimo valore nell'array
# $v1: error flag

	.text
	.globl trovamax

trovamax:
	ble $a1 0 err # if numel<=0 error
	lw $t0 0($a0) # carico primo el, valore del max inizializzato
	li $t1 1 # $t1 indice del prossimo el
	move $v0 $t1 # speculo sul max scommettendo sia il prossimo el
	
	add $t1 $t1 1
loop:
	bgt $t1 $a1 end	# se non ci sono altri elementi termina
	add $a0 $a0 4 # altrimenti acquisisci il prossimo elemento
	lw $t2 0($a0)
	ble $t2 $t0 next
	move $v0 $t1 # update indice max
	move $t0 $t2 # update valore max
next:
	add $t1 $t1 1
	j loop
err:
	li $v1 1
end:
	sub $v0 $v0 1
	jr $ra