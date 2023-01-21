	.data
A:	.word -1 -1 1 4
B:	.word -1 6 -1 -1
c:	.word 2

	.text
	.globl main
main: 
	# carico gli indirizzi nei registri
	la $s0 A
	la $s1 B
	la $s2 c

	# calcolo dell'espressione

	## NUMERATORE in $t2

	### STEP N1: carico A[c] in $t3
	lw $t0 0($s2) # $t0<-c
	li $t1 4
	mul $t2 $t0 $t1 # # $t2<-c*4, offset di A[c]
	add $t2 $s0 $t2 # $t2<-$s0+$t2, indirizzo di A[c]
	lw $t3 0($t2) # $t3<-A[c]

	### STEP N2: carico B[A[c]] in $t2
	mul $t3 $t3 $t1	# $t3<-4*A[c], offset di B[A[c]] (ricorda che in $t1 ho 4)
	add $t3 $s1 $t3 # $t3<-$s1+$t3, indirizzo di B[A[c]]
	lw $t2 0($t3) # $t2<-B[A[c]]
	
	### STEP N3: carico (B[A[c]] + c) in $t2
	add $t2 $t0 $t2
	
	### STEP N4: carico  c*(B[A[c]]+c) in $t2
	mul $t2 $t0 $t2 # ricorda che in $t0 ho c	
	
	## DENOMNATORE in $t3	
	li $t3 2
	mul $t3 $t0 $t3 # $t3<-2*c	
	addi $t3 $t3 -1 # $t3<-2*c-1	
	mul $t3 $t1 $t3 # $t3-<4*(2*c-1), offset di A[2*c-1] (ricorda che in $t1 ho 4)
	add $t3 $s0 $t3 # $t3<-$s1+$t3, indirizzo di A[2*c-1]
	lw $t3 0($t3) # $t0<-A[2*c-1]	
	
	## calcolo la divisione in $t2 (numeratore/denominatore)
	div $t2 $t2 $t3
	
	# memorizzo il risultato A[c-1]	
	addi $t0 $t0 -1 # $t0<-c-1	
	mul $t0 $t0 $t1 # $t0<-(c-1)*4, offset di A[c-1] (ricorda che in $t1 ho 4)
	add $t1 $s0 $t0 # $t1<-$s0+$t0, indirizzo di A[c-1]
	sw $t2 0($t1)