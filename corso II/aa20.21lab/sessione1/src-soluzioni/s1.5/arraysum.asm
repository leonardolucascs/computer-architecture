#### segmento dati inizia qui
	.data
h:	.word 10
A:	.word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
# RICORDA: le label sono indirizi quindi:
# h: indirizzo della variabile h
# A: base address dell'array A (o, in alternativa, del primo elemento dell'array)
# A+4*1: address dell'i-esimo elemento dell'array
##### segmento dati finisce qui

#### segmento testo inizia qui
	.text
	.globl main
main:
	# carico gli indirizzi di h e A in due registri
	la $s1 h
	la $s2 A
	
	# carico valore di h
	lw $t0, 0($s1)
	
	# carico valore di A[8], offset=4*8=32
	lw $t1, 32($s2)
	
	# calcolo somma h + A[8]
	add $t0, $t1, $t0
	
	# salvo il risultato in memoria (in A[12], offset=4*12=48)
	sw $t0, 48($s2)
#### segmento testo finisce qui
