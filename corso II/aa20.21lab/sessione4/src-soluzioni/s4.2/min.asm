# INPUT 
# $a0: base address array
# $a1: dimensione array
# $a2: passo
# OUTPUT
# $v0: minimo tra i numeri considerati

	.text
	.globl min
min:
	mul $t0, $a2, 4		#t0=offset tra el. (passo)
	move $t1, $a0		#t1=indirizzo prossimo el.
	lw $t2, 0($t1)		#t2=el. considerato
	j updatemin
loop:
	slt $t4, $zero, $a1
	beq $t4, 0, end
	lw $t2, 0($t1)
	slt $t3, $t2, $v0
	bne $t3, 1, continue
updatemin:
	move $v0, $t2	
continue:
	sub $a1, $a1, $a2
	add $t1, $t1, $t0
	j loop
end:
	jr $ra
