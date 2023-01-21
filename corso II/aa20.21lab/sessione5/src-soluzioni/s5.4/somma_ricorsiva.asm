	.text
	.globl S
S:    
	addi $sp $sp -8 # Salvo sullo stack $ra e dim-1
	addi $t0 $a1 -1
	sw $t0 0($sp)
	sw $ra 4($sp)
		
	bne  $a1 $zero rec_step

	# Caso base: se array vuoto restituisce 0
	li $v0 0
	addi $sp $sp 8 # dealloco stack frame
	jr $ra

	# step ricorsivo
rec_step:
	# in $a0 ho ancora il base addres (primo arg ok)
	move $a1 $t0 # aggiorno secondo argomento a dim-1
	jal S

	# Qui assumo che in $v0 ho S(arr dim-1)
		
	lw $t0 0($sp) # ripristino dim-1 (serve per caricare arr[dim-1])
	add $sp $sp 4
	mul $t1 $t0 4
	add $t1 $t1 $a0 # indirizzo di arr[dim-1]
	lw $t2 0($t1) # t2<-arr[dim-1]
	
	add $v0 $v0 $t2 # $v0<-S(arr dim-1)+arr[dim-1]

	lw $ra 0($sp) # ripristino $ra
	add $sp $sp 4 # dealloco stack frame
	jr $ra
