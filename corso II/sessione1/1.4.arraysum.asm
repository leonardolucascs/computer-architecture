# Lettura da memoria e scrittura in array
# Si scriva il codice Assembly che effettui:
#   A[12] = h + A[8];
# Si scriva il codice, senza eseguirlo, supponendo che:
#  • la variabile h sia memorizzata all’indirizzo contenuto in $s1; 
#  • il base address di A sia nel registro $s2.
	
### segmento dati inizia qui
	.data
h:	.word 10
A:	.word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15


### segmento testo inizia qui	
	.text
	.globl main
	
main:
	# carico valori h e A in due registri
	la $s1, h
	la $s2, A
	
	# carico valore di h
	lw $t0, 0($s1)
	
	# carico valore di A[8]
	lw $t1, 32($s2)
	
	# somma h + A[8]
	add $t0, $t1, $t0
	
	# salvo somma in A[12]
	sw $t0, 48($s2)
