	.text
	.globl fibonacci
	
fibonacci:
	# preambolo
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	# altre sw in base ai registri $s usati
	addiu $sp $fp -16
	
	# codice
	# F(n) = F(n-2) + F(n-1), se n > 1 ;
	# F(n) =1, se n=1 ;
    # F(n) =0, se n=0.
	move $s0 $a0  # mi salvo in n in $s0
	beq $a0 $zero zero  # in alternative beqz $a0 zero
	addi $a0 $a0 -1
	beq $a0 $zero uno
# caso ricorsivo 	
	# chiamata a Fibonacci(n-2)
	addi $a0 $s0 -2
	jal fibonacci
	move $s1 $v0  # in $s1 abbiamo Fibonacci(n-2)
	# chiamata a Fibonacci(n-1)
	addi $a0 $s0 -1
	jal fibonacci
	
	add $v0 $s1 $v0
	j end
zero:
	move $v0 $zero    # alternative  li $v0 0
	j end
uno:
	li $v0 1
end:
	# epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	# altre lw in base ai registri $s0 usati
	move $fp $t0
	
	
	jr $ra