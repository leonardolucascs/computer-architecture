	.data
array: 	.word 1,2,3,4,5

	.text
	.globl main
main:
	# invoco la funzione
	la $a0 array
	li $a1 5
	jal stampaContrario

	# exit
	li $v0 10
	syscall
