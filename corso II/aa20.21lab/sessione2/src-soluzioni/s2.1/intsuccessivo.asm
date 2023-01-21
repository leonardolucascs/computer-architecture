	.data
msg1:	.asciiz "Inserire numero intero: "	
msg2:	.asciiz "L'intero successivo è: "

	.text
	.globl main
main:
	li $v0 4 # selezione di print_string (codice = 4)
	la $a0 msg1	# $a0 = indirizzo di msg1
	syscall

	li $v0 5 # Selezione read_int (codice = 5)
	syscall	
	move $t0 $v0 # sposto il risultato in $t0

	li $v0 4 # selezione di print_string
	la $a0 msg2 # $a0 = indirizzo di string2
	syscall			
	
	addi $t0 $t0 1 # $t0+=1

	li $v0 1 # selezione di print_int (codice = 1)
	add $a0 $zero $t0 # $a0 = $t0
	syscall			

	li $v0 10 # exit
	syscall