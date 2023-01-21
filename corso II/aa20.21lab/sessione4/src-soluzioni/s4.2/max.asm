# INPUT 
# $a0: base address array
# $a1: dimensione array
# $a2: passo
# OUTPUT
# $v0: massimo tra i numeri considerati

	.text
	.globl max
max:
	mul $t0, $a2, 4		#t0=offset tra el. (passo)
	move $t1, $a0		#t1=indirizzo prossimo el.
	lw $t2, 0($t1)		#t2=el. considerato
	j updatemax
loop:
	slt $t4, $zero, $a1
	beq $t4, 0, end
	lw $t2, 0($t1)
	slt $t3, $v0, $t2
	bne $t3, 1, continue
updatemax:
	move $v0, $t2	
continue:
	sub $a1, $a1, $a2
	add $t1, $t1, $t0
	j loop
end:
	jr $ra
