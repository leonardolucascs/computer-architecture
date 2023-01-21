	.text
	.globl S

# la producura si aspetta 
# in $a0 l'indirizzo base dell'array	
# in $a1 la dimensione su cui calcolare la somma
S:    
	# preambolo
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)     # Salvo sullo stack $ra
	addiu $sp $fp -8	
		
	bne  $a1 $zero rec_step

	# Caso base: se array vuoto restituisce 0
	li $v0 0
	j end

	# step ricorsivo
rec_step:
	# metto in $t0 il valore dim -1
	addi $t0 $a1 -1
	# PUSH mi salvo $t0 
	addi $sp $sp -4
	sw $t0 0($sp)
	
	# in $a0 ho ancora il base addres (primo arg ok)
	move $a1 $t0 # aggiorno secondo argomento a dim-1
	jal S

	# Qui assumo che in $v0 ho S(arr dim-1)
	
	# POP recupero $t0 	
	lw $t0 0($sp) # ripristino dim-1 (serve per caricare arr[dim-1])
	add $sp $sp 4
	
	mul $t1 $t0 4
	add $t1 $t1 $a0 # indirizzo di arr[dim-1]
	lw $t2 0($t1) # t2<-arr[dim-1]
	
	add $v0 $v0 $t2 # $v0<-S(arr dim-1)+arr[dim-1]
	
end:	
	#epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0    # ripristino fp del chiamante

	jr $ra
