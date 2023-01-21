# Calcolo di un espressione
# Si traduca in Assembly la seguente riga di codice:
# 	A = B+C-(D+E)
# assegnando alle variabili
# 	A, B, C, D, E
# i registri
# 	$s0, ..., $s4.
# Si assumano valori iniziali
# 	1, 2, 3, 4

	.text
	.globl main

main:
	# carico i valori nei registri 
	li $s1, 1	# B
	li $s2, 2	# C
	li $s3, 3	# D
	li $s4, 4	# E
	
	add $t0, $s1, $s2	# t0 <- B+C
	add $t1, $s3, $s4	# t1 <- D+E
	sub $s0, $t0, $t1	# s0 <- B+C-(D+E)
