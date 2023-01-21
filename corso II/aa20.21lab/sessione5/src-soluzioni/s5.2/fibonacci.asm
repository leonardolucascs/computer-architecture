	.text
	.globl fibonacci
fibonacci:
	sub $sp $sp 12
	sw $s0 8($sp)
	sw $s1 4($sp)
	sw $ra 0($sp)
	
	move $s0 $a0 #$s0-<N
	li $t0 1
	beq $s0 $t0 fib_di_1 # se N==1 caso base 1
	li $t0 2
	beq $s0 $t0 fib_di_2 # se N==2 caso base 2
	# step ricorsivo
	# calcolo fibonacci(N-1)
	sub $a0 $s0 1
	jal fibonacci
	move $s1 $v0 # s1<-fibonacci(N-1)
	# calcolo fibonacci(N-2)
	sub $a0 $s0 2 # $a0<-N-2
	jal fibonacci
	add $v0 $s1 $v0	# v0<-fibonacci(N-1)+fibonacci(N-2)
	j return_fibonacci
fib_di_1:
	li $v0 0
	j return_fibonacci
fib_di_2:
	li $v0 1
return_fibonacci:
	lw $ra 0($sp)
	lw $s1 4($sp)
	lw $s0 8($sp)
	addi $sp $sp 12 
	jr $ra