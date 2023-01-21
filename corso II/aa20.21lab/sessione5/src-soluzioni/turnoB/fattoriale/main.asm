	.data
msg: .asciiz "Il fattoriale di: "
	
	.text
	.globl main

main:
	li $a0 6  # 6! 
	jal fattoriale_no_s0
	move $t0 $v0
	
	
	# stampa del risultato
	li $v0 1 		# print int
	move $a0 $t0
	syscall
	# exit
	li $v0 10
	syscall
	
# nella file assemblato ci sara' il codice di fattoriale.asm