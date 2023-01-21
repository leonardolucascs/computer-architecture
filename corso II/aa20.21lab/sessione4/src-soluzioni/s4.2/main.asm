	.data
A: 	.word 34,227,224,226,14,17,112,16 # matrice A
dimA: 	.word 8 # dimensione di A

	.text
	.globl main
main:
	la $t0, dimA

	la $a0, A	# base address
	lw $a1, 0($t0) # dimensione
	li $a2 1 # passo
#	jal max
	jal min
	
	# print int
	move $a0, $v0
	li $v0, 1
	syscall
	
	# exit
	li $v0, 10
	syscall
