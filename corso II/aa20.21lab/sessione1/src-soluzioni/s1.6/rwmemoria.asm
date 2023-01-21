	.data
A:	.space 400 # 400 byte per 100 elementi da 32 bit
B:	.space 400
C:	.word 2
i:	.word 3

	.text
	.globl main
main:
	# Inizializzazione registri indirizzi
	la $s0 A
	la $s1 B
	la $s2 C
	la $s3 i

	# inizializzaione B[i]=10
	li $t0 4 # carico la costante 4, servirà per il calcolo dell'offset
	lw $t1 0($s3)# $t1<-i, carico l'indice i	
	mul $t0 $t0 $t1 # calcolo l'offset i*4
	
	add $t1 $s1, $t0 # indirizzo dell'elemento: base addr + offset
	li $t2 10
	
	# carico in memoria
	sw $t2 0($t1)

	# calcolo epressione
	lw $t0, 0($t1) # $t0<-B[i]
	lw $t1, 0($s2) # $t1<-C
	add $t0, $t0, $t1 # $t0<-B[i]+C
	addi $t0, $t0, 5 # $t0<-$t0+5
	# salvo il risultato in memoria, offset=4*99=396
	sw $t0,396($s0)