	.text
	.globl main
main:
	# carico i valori nei registri	
	li $s1 1 # A
	li $s2 2 # B
	li $s3 3 # C
	li $s4 4 # D

	add $t0, $s1, $s2 # t0<-B+C
	add $t1, $s3, $s4 # t1<-D+E
	sub $s0, $t0, $t1 # s0<-(B+C)-(D+E)