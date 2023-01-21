# Lettura e scrittura da memoria (2)
# Si scriva il codice Assembly che effettui:
# 	A[c-1] = c*(B[A[c]] + c)/A[2*c-1]
# Inizializzazione dei registri indirizzi: 
# • i vettori A e B contengono 4 elementi, ogni elemento è un intero a 32 bit;
# • la variabile c è intero a 32 bit. Inizializzazione dei valori dati in memoria:
#  c=2 
#  A[0]=-1 
#  A[1]=-1 
#  A[2]= 1 
#  A[3]= 4 
#  B[0]=-1 
#  B[1]= 6 
#  B[2]=-1 
#  B[3]=-1

	.data
A:	.word -1 -1 1 4
B:	.word -1 6 -1 -1
c:	.word 2

	.text
	.globl main
main:
	# Inizializzazione registri indirizzi
	la $s0, A
	la $s1, B
	la $s2, c
	
	## NUMERATORE in $t2
	lw $t0, 0($s2)		# t0 <- 2=c
	mul $t1, $t0, 4		# offset A[c]
	add $t1, $t1, $s0 	# t1 <- indirizzo A[c]
	addi $t4, $t1, 0	# indirizzo per utilizzo espressione
	lw $t1, 0($t1)		# t1 <- A[c]
	mul $t2, $t1, 4		# offset B[A[c]]
	add $t2, $t2, $s1	# t2 <- indirizzo B[A[c]]
	lw $t2, 0($t2)		# t2 <- B[A[c]]
	
	add $t2, $t2, $t0	# t2 <- B[A[c]]+c
	mul $t2, $t2, $t0	# t2 <- c*(B[A[c]]+c)
	
	## DENOMINATORE in $t3
	mul $t0, $t0, 2
	sub $t0, $t0, 1
	mul $t0, $t0, 4		# offset A[2*c-1]
	add $t0, $t0, $s0	# t0 <- indirizzo A[2*c-1]
	
	lw $t3, 0($t0)		# t3 <- A[2*c-1]
	
	# Calcolo espressione
	li $t0, -1
	mul $t0, $t0, 4		# (1 * 4byte) 
	sub $t1, $t4, $t0	# indirizzo A[c] - 4 byte = A[c-1]
	div $t0, $t2, $t3
	sw $t0, 0($t1)