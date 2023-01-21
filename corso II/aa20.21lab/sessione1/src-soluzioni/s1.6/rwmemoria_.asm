	.data 
	A: .space 400	# vettore con 100 elementi
	B: .space 400	# vettore con 100 elementi
	C: .space 4	# intero a 32 bit
	i: .space 4	# intero a 32 bit

	.text
	.globl main

main:

	# Inizializzazione registri indirizzi
	la $s0, A
	la $s1, B
	la $s2, C
	la $s3, i

	#Inizializzazione valori (i=3, C=2)
	addi $t0, $zero, 3	# $t0=3 
	sw $t0, 0($s3)		# i=$t0=3
	addi $t0, $zero, 2	# $t0=2
	sw $t0, 0($s2)		# C=$t0=2

	# Inizializzazione valori (B[i]=10)
   	addi $t0, $zero, 4	# $t0 = 4
  	lw $t1, 0($s3)		# $t1 = i
  	mult $t0, $t1		# lo = $t0 * $t1 = i *4
  	mflo $t0 		# $t0= lo 
   	add $t1, $s1, $t0	# $t1 = $s1 + $t0, address of B[i]
   	addi $t2, $zero, 10 	# $t2 = 10
	sw $t2, 0($t1)		# B[i] = $t2 = 10
    
   	# calcolo espressione
   	lw $t0, 0($t1)		# $t0 = B[i]
   	lw $t1, 0($t2)		# $t1 = C
   	add $t0, $t0, $t1	# $t0 += C
   	addi $t0, $t0, 5 	# $t0 += 5
   	sw $t0 , 396($s0)	# A[99] = $t0
	
