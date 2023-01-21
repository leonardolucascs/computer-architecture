	.text
	.globl fattoriale
	
fattoriale:
	sub $sp $sp 8
	sw $s0 4($sp)
	sw $ra 0($sp)
	
	move $s0 $a0
	
	beq $s0 $zero fatt_di_0	# if(N==0) caso base
	# step ricorsivo
	sub $t0 $s0 1
	move $a0 $t0
	jal fattoriale # calcolo fattoriale(N-1)
	mul $v0 $s0 $v0	# calcolo e restituisco N*fattoriale(N-1)
	j return_fattoriale
	
fatt_di_0:
	li $v0 1 # caso base, restituisco 1
	
return_fattoriale:
	lw $ra 0($sp)
	lw $s0 4($sp)
	add $sp $sp 8 
	jr $ra