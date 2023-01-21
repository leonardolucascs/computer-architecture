	.data
_debug: .asciiz "CHIAMATA vector_expand\n"
	
	.text
	.globl vector_expand

# INPUT
# $a0: indirizzo base del vecchio vettore
# OUTPUT
# $v0: indirizzo del nuovo vettore
vector_expand:
	move $t0 $a0   # $t0: indirizzo base del vettore
	lw $t1 0($t0)  # $t1: numero di elementi attualmente nel vettore da espandere
	lw $t2 4($t0)  # $t2: capacita' del vettore da espandere
	
	###DEBUG####
	li $v0 4
	la $a0 _debug
	syscall
	############
	# ESPANSIONE 
	# calcolo la nuova capacita'  = capacita' attuale * 2 
	mul $t2 $t2 2   # *2
	# chiedo allocazione area di memoria dimensiona attuale (* 2 + 2)*4
	li $v0 9
	addi $a0 $t2 2
	mul $a0 $a0 4   # moltiplico per 4 perchè sono word e metto in $a0
	syscall
	move $t3 $v0   # $t3: indirizzo base del nuovo vettore
	
	# copia del vecchio vettore nel nuovo
	# inserisco i primi 2 elementi [ Numero elementi, capacita']
	sw $t1 0($t3)
	sw $t2 4($t3)
	
	
	addi $t4 $t0 8  #indirizzo del prima posizione che contiene elementi nel vettore originale
	addi $t5 $t3 8  #indirizzo del prima posizione che contiene elementi nel nuovo vettore
loop:
	# in $t1 abbiamo il numero di elementi ancora da copiare
	beq $t1 $zero end_loop
	
	lw $t6 0($t4)  # carico il valore dell'elemento del vettore originale 
	sw $t6 0($t5)  # scrivo il valore dell'elemento del vettore originale nel nuovo vettore
	
	# calcolo gli indirizzi dei successivi elementi
	addi $t4 $t4 4 	# la prossima word del vettore originale
	addi $t5 $t5 4  # la prossima word del nuovo vettore
	# decremento il numero di elementi rimanenti
	addi $t1 $t1 -1
	
	j loop
end_loop:
	
	move $v0 $t3  # preparo output
	
	jr $ra

	
	
