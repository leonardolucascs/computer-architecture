# INPUT:
# $a0 = base address dell'array
# $a1 = numero di elementi nell'array

	.data
sep:	.asciiz " "
br:	.asciiz "\n"

	.text
	.globl printarray

printarray:
	ble $a1 0 end # if numel<=0 termina
	move $t0 $a0
loop:
	# stampo prossimo intero
	li $v0 1
	lw $a0 0($t0)
	syscall
	
	# stampo separatore
	li $v0 4
	la $a0 sep
	syscall

	add $t0 $t0 4 # indirizzo del prossimo da stampare
	sub $a1 $a1 1 # rimanenti da stampare
	bgt $a1 0 loop
end:
	# stampo a capo e termino
	li $v0 4
	la $a0 br
	syscall
	
	jr $ra