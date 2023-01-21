	.data
sep:	.asciiz ", "	
	.text
	.globl stampaContrario
stampaContrario:
	bne $a1 1 rec_step

	# Caso base: se array ha un solo elemento lo stampo e termino
	li $v0 1
	lw $a0 0($a0)
	syscall
	jr $ra

	# step ricorsivo
rec_step:
	sub $sp $sp 8
	sw $ra 4($sp)
	sw $s0 0($sp)

	lw $s0 0($a0) # carico il primo elemento dell'array in $s0
	# chiamata ricorsiva
	add $a0 $a0 4
	sub $a1 $a1 1
	jal stampaContrario # stampaContrario su array che va da secondo el fino alla fine
	# stampo primo el
	li $v0 4
	la $a0  sep
	syscall	
	li $v0 1
	move $a0 $s0
	syscall
	# termino
	lw $ra 4($sp)
	lw $s0 0($sp)
	add $sp $sp 8
	jr $ra
