# Intero e successivo in array
# 
# Si scriva codice assembly che:
# • chieda all’utente di inserire un intero (messaggio su terminale);
# • acquisisca un intero da terminale;
# • calcoli l’intero successivo;
# • memorizzi l’intero ed il successivo in un array di dimensione 2 in memoria; 
# • mostri all’utente i due numeri (messaggio su terminale).

	.data
msg1:	.asciiz	"Inserisci un intero: "
msg2:	.asciiz "\nOutput: "
space:	.asciiz " "
	.align 2
array:	.space 8 # alloca spazio in bytes; 8 bytes = 2 word -> x 2 valori

	.text
	.globl main
main:
	li $v0 4	# print string
	la $a0 msg1
	syscall
	
	li $v0 5	# read integer
	syscall 
	move $t0 $v0
	
	addi $t1 $t0 1
	
	# store interi in memoria
	la $t2 array
	sw $t0 0($t2)	# array[0]: input_int
	sw $t1 4($t2)	# array[1]: array[0] + 1
	
	li $v0 4	# print string
	la $a0 msg2
	syscall
	
	li $v0 1	# print integer
	move $a0 $t0
	syscall
	
	li $v0 4	# print string
	la $a0 space
	syscall
	
	li $v0 1	# print integer
	move $a0 $t1
	syscall
	
	li $v0 10	# exit
	syscall 
