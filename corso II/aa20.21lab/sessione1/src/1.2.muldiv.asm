# Moltiplicazione e divisione
# Si implementi il codice Assembly che effettui la moltiplicazione 
# e la divisione tra i numeri 100 e 45, utilizzando le istruzioni 
# dell’ISA e le pseudoistruzioni.

	.text
	.globl main
	
main:	
	li $t1, 100	# s1 <- 100
	li $t2, 45	# s2 <- 45
	
	# moltiplicazione con istruzione MIPS
	mult $t1, $t2	# [hi, lo] <- t1*t2
	mflo $t0	# t0 <- lo
	
	# stessa moltiplicazione usando la pseudo-istruzione
	mul $t0, $t1, 45
	
	# divisione con istruzione MIPS
	div $t1, $t2	# lo <- t1/t2, hi <- t1%t2
	mflo $t0
	
	move $t0, $zero		# reset t0
	mult $zero, $zero	# reset hi & low = 0
	# stessa divisione usando la pseudo-istruizione
	div $t0, $t1, $t2	# t0 <- t1/t2
	# quest'ultima istruzione viene vista e scomposta come
	# bne $10, $0, 1	dove fa un controllo, una branch if not equal tra il secondo_op e 0, saltando alla label 1
	# break			che termina l'esecuzione in caso affermativo $10 = 0
#1:	  div $9, $10 		label 1, che probabilmente la crea il compilatore, su div $9, $10
	# mflo $8		che sposta il risultato in $t0
# guardare esecuzione passo-passo per capire quanto spiegato.
