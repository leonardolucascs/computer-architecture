	.text
	.globl push_back

# Inserisce l'elemento in fondo al vettore se c'e' spazio, altrimenti
# crea un vettore di dimensione doppia, copia tutti gli elementi e aggiunge in coda
# INPUT:
# $a0 = indirizzo base del vettore
# $a1 = elemento da inserire 
# OUTPUT
# v0 = indirizzo del vettore (il vecchio o il nuovo indirizzo )

push_back:
	# PREAMBOLO
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	addiu $sp $fp -16

	# FINE PRAMBOLO
	# CODICE
	move $s0 $a0   # $s0: indirizzo base dell'array
	move $s1 $a1   # $s1: elmento da aggiungere
	
	lw $t0 0($a0)  # $t0: numero di elementi attualmente nel vettore
	lw $t1 4($a0)  # $t1: capacita' del vettore
	# se numero elementi < capacita' ho ancora spazio!
	blt $t0 $t1 insert_element  
	# chiamo vector_expand
	# in $a0 ho ancora l'indirizzo base del vettore da espandere 
	jal vector_expand
	move $s0 $v0  # aggiorno l'indirizzo base del vettore -> dovro' aggiungere l'elemento a questo
insert_element:
	# calcolo l'indirizzo della posizione del vettore da scrivere
	addi $t0 $s0 8 	# salto i primi due elementi
	lw $t1 0($s0)
	mul $t1 $t1 4 
	add $t0 $t0 $t1 	# indirizzo A[n]
	# scrivo elemento nella posizione
	sw $s1 0($t0)
	
	# incremento numero di elementi nel vettore
	lw $t0 0($s0)
	add $t0 $t0 1
	sw $t0 0($s0)
	
	# preparo valore di ritorno
	move $v0 $s0
	# FINE CODICE
	# EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	# FINE EPILOGO
	
	jr $ra
	
