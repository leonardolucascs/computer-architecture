	.text
main:
	# leggo primo intero
	li $v0 5
	syscall
	move $s0 $v0

	# leggo secondo intero
	li $v0 5
	syscall
	move $s1 $v0

	li $s2 0 # $s2 è segno del risultato 0 positivo o nullo, 1 negativo
	
	# calcolo il segno del risultato
	blt $s0 $zero neg1
	# se qui $s0>=0
	blt $s1 $zero isneg
	# se qui risultato sarà>=0
	j multiply
neg1:
	# se qui $s0<0
	bge $s1 $zero isneg
	j multiply
isneg:
	# se qui risultato sarà <0
	li $s2, 1

	# moltiplico in valore assoluto
multiply:
	abs $a0 $s0
	abs $a1 $s1
	jal prodotto_s
	move $t0 $v0

	# aggiusto il segno
	bne $s2 1 pos
	neg $t0 $t0 # fa il complemento a 2 (cambia di segno)	
pos:
	# stampo il risultato
	li $v0 1
	move $a0 $t0
	syscall

	# exit
	li $v0 10
	syscall
