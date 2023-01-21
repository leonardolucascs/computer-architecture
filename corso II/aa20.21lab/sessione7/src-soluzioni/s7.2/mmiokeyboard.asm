	.data
outstr : .asciiz "Caratteri scritti: "

	.text
	.globl main

main:
	la $t8 0xFFFF0000 # Keyboard address control
	la $t9 0xFFFF0004 # Keyboard address data
	li $t7 0x0A # \n
	move $t6 $zero

loop:
	lw $t0 0($t8) # Controlla se è stato premuto un tasto
	bne $t0 1 endloop # Se non è stato letto itera
	lw $t1 0($t9) # Leggi il carattere
	sw $zero 0($t8) # Consuma il carattere
	beq $t1 $t7 exit # Se il carattere è newline termina
	addi $t6 $t6 1 # Incrementa il contatore
endloop:
	j loop

exit:
	la $a0 outstr # Stringa da stampare
	move $a1 $t6 # Valore da stampare
	li $v0 56 # Numero syscall
	syscall

	# exit
	li $v0 10
	syscall
