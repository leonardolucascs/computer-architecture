	.text
	.globl fattoriale

fattoriale:
	# in $a0 abbiamo il numero n
	# PREAMBOLO
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	addiu $sp $fp -12
	# CODICE
	# if n == 0 -> return 1
	# else return n* fattoriale(n-1)
	move $s0 $a0 # in $s0 tengo il valore di n
	
	bne $s0 $zero ricorsione 
	# caso base
	li $v0 1
	j end
ricorsione:	
	# n-1
	addi $a0 $s0 -1
	jal fattoriale
	#v0 = fattoriale(n-1)
	#v0 = v0 * s0
	mul $v0 $v0 $s0
 
	
end:
	# EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra