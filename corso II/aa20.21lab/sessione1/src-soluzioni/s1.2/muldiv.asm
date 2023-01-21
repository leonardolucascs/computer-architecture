	.text
	.globl main
main:
	li $s1 100 # s1<-100
	li $s2 45 # s2<-45

	# moltiplicazione con istruzione MIPS
	mult $s1, $s2 # [Hi, Lo]<-s1*s2
	mflo $s0 # s0<-Lo

	# stessa moltiplicazione usando la pseudo-istruzione mul
	mul $s0, $s1, $s2 # s0<-s1*s2

	# divisione con istruzione MIPS
	div $s1, $s2 # Hi<-s1%s2, Lo<-s1/s2
	mflo $s0 # s0<-Lo

	# stessa divisione usando la pseudo-istruzione div
	# ATTENZIONE: sia l'istruzione che la pseudo-istruzione si chiamano 'div'!
	div $s0, $s1, $s2 # s0<-s1/s2