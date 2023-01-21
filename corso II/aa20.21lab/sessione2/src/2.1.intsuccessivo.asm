# Intero successivo
#
# Si scriva codice assembly che:
# • chieda all’utente di inserire un intero (messaggio su terminale);
# • acquisisca un intero da terminale;
# • calcoli l’intero successivo;
# • mostri all’utente il risultato (messaggio su terminale).

	.data
msg1:	.asciiz "Inserisci un numero intero: "
msg2:	.asciiz "L'intero successivo è: "

	.text
	.globl main
main:
	# Stampa richiesta utente
	li $v0 4	# load $v0 codice syscall (print string)
	la $a0 msg1	# load $a0 argomento da passare
	syscall		# chiamata
	
	# Richiesta inserimento intero
	li $v0 5	# 5 - read integer
	syscall
	
	move $t0 $v0	# sposto input letto
	addi $t0 $t0 1
	
	# Stampa output richiesto
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1	# 1 - print integer
	move $a0 $t0
	syscall
	
	li $v0 10	# exit
	syscall
