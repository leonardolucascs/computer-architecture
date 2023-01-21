	.data
msg1:	.asciiz "Dammi un intero: "
msg2:	.asciiz "I due numeri sono: "
msg3:	.ascii " "
	.align 2
array:	.space 8 # array di dimensione 2 (non inizializzo)

	# segmento dati equivalente senza direttiva di allineamento
	#.data
#array: .space 8
#msg1: .asciiz "Dammi un intero: "
#msg2: .asciiz "I due numeri sono: "
#msg3: .asciiz " "

	.text
	.globl main
main:
	li $v0 4 # selezione print_string
	la $a0 msg1	# $a0<-indirizzo di msg1
	syscall	

	li $v0 5 # selezione di read_int
	syscall
	move $t0 $v0

	la $s1 array # $s1<-base address di array	
	sw $t0 0($s1) # array[0]<-numero inserito dall'utente
	addi $t0 $t0 1 # calcolo successivo
	sw $t0 4($s1) # array[1]<-successivo

	li $v0 4 # selezione di print_string
	la $a0 msg2 # $a0<-indirizzo di msg2
	syscall

	li $v0 1 # selezione di print_int
	lw $t0 0($s1) # carico da array	(primo elemento)
	move $a0 $t0 # passo il valore alla syscall
	syscall

	li $v0 4 # selezione di print_string
	la $a0 msg3 # $a0<-indirizzo di msg3
	syscall

	li $v0 1 # selezione di print_int
	lw $t0 4($s1) # carico da array (secondo elemento)
	move $a0 $t0 # passo il valore alla syscall
	syscall

	li $v0 10 # exit
	syscall
