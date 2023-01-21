# INPUT:
# $a0 e $a1 due interi
# OUTPUT:
# la loro somma

	.text
	.globl somma

somma:
	add $v0 $a0 $a1
	jr $ra