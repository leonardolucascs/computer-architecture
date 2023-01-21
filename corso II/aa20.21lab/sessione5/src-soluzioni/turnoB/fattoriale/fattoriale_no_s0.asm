	.text
	.globl fattoriale_no_s0

fattoriale_no_s0:
	# in $a0 abbiamo il numero n
	# PREAMBOLO
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	#sw $s0 -12($fp)
	addiu $sp $fp -8
	# CODICE
	# if n == 0 -> return 1
	# else return n* fattoriale(n-1)
	#move $s0 $a0 # in $s0 tengo il valore di n
	
	bne $a0 $zero ricorsione 
	# caso base
	li $v0 1
	j end
ricorsione:	
	# salvo il valore di n sullo stack -> push di $a0
	addiu $sp $sp -4
	sw $a0 0($sp)
	# n-1
	addi $a0 $a0 -1
	jal fattoriale_no_s0
	# pop di $a0
	lw $a0 0($sp)
	addiu $sp $sp 4
	#v0 = fattoriale(n-1)
	#v0 = v0 * s0
	mul $v0 $v0 $a0
 
	
end:
	# EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	#lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra