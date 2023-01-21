 	.data
 msg1:	.asciiz "Hello World!"
 msg2:	.asciiz	"Inserisci un intero"
 
 	 .text
 	 .globl main
 main:
 	# Stampiamo una stringa nello std.outup (la console)
 	li $v0 4	# fase in cui carichiamo in v0 il codice della syscall
 	la $a0 msg1	# caricamento argomenti
 	syscall
	
	# Stampiamo una stringa in una finestra di dialogo
	li $v0 55
	la $a0 msg1
	li $a1 1
	syscall
	
	# Leggiamo un intero in input con una finestra di dialogo
	li $v0 51	# input messo in $a0, stato in $a1
	la $a0 msg2
	syscall
	
	# Exit
	li $v0 10
	syscall