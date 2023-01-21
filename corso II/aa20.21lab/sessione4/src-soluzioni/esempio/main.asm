	.text
	.globl main
main:
	# passaggio dei parametri
	li $a0 1
	li $a1 2
	
	# invoco la funzione maxpp
	jal maxpp
		
	# in $v0 ho il risultato restituito dalla funzione
	move $a0 $v0
	li $v0 1
	syscall
	
	# exit
	li $v0 10
	syscall