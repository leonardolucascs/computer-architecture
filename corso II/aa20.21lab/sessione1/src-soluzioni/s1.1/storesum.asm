	.text
	.globl main
main:
	# carico valore con add
	#addi $s1, $zero, 5
	#addi $s2, $zero, 7
	
	# versione alternativa: uso pseudo istruzioni
	li $s1 5
	li $s2 7
		
	add $s0, $s1, $s2