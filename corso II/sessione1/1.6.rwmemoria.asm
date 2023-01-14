# Lettura e scrittura da memoria (1)
#
# Si scriva il codice Assembly che effettui:
#    A[99] = 5 + B[i] + C
# Inizializzazione dei registri indirizzi:
# • i vettori A e B contengono 100 elementi, ogni elemento è un intero a 32 bit;
# • variabili C e i sono interi a 32 bit. Inizializzazione dei valori dati in memoria:
# i=3, C=2, B[i]=10.

	.data
A:	.space 400	# alloca spazio per array di 100 elementi(4 byte x singolo)
B:	.space 400
i:	.word 3		# i=3
C:	.word 2		# C=2

	.text
	.globl main
	
main:
	# Inizializzazione registri indirizzi
	la $s1, A
	la $s2, B
	la $t1, i
	la $t2, C
	
	# Carico valori (i, C)
	lw $s3, 0($t1)	# s3 <- 3 = i
	lw $s4, 0($t2)	# s4 <- 2 = C
	
	# Inizializzazione B[i]=10
	addi $t2, $zero, 4
	mul $t3, $s3, 4		# calcolo offset B[i]
	add $t3, $s2, $t3 	# calcolo indirizzo B[i]
	add $t4, $zero, 10
	sw $t4, 0($t3)		# store valore in B[i]
	
	# Calcolo espressione
	addi $t1, $t4, 5	# t1 = B[i] + 5
	add $s3, $t1, $s4	# s3 = B[i] + 5 + C
	
	# Salvo in A[99]
	mul $t3, $t2, 99	# calcolo offset A[99] = 99*4byte
	add $t3, $s1, $t3	# calcolo indirizzo A[99]
	sw $s3, 0($t3)
	
	
