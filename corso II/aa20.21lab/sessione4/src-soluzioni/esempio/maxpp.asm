	.text
	.globl maxpp
maxpp:
	# int maxpp(int a, int b)
	# $a0: primo intero
	# $a1: secondo intero
	# restituisce in $v0 max{a,b}+1
	
	sub $sp $sp 4
	sw $s0 0($sp)
	
	move $s0 $a1
	bgt $a1 $a0 maxpp_end
	move $s0 $a0	
maxpp_end:
	add $s0 $s0 1
	move $v0 $s0
	
	lw $s0 0($sp)
	add $sp $sp 4
	jr $ra