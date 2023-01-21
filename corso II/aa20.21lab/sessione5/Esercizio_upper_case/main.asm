# convertire una stringa di sole lettere minuscole in maiuscolo
# invocando la funzione upper_case_word
	.data
nome: 	.asciiz "Chris tian|"
cognome:.asciiz "quadri"

	.text
	.globl main

main:
	li $s0 15
	li $s1 8
	
	# chiamo la funzione passando <nome>
	la $a0 nome
	jal upper_case_word
	
	li $v0 4 # print string
	la $a0 nome
	syscall
	
	#Analogo procedimento per il cognome
	
	#exit syscall
	li $v0 10
	syscall
