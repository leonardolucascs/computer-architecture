# Importante: non mettere altri dati prima del frameBuffer
# NOTA: il tool Bitmap Display deve essere connesso a MARS e settato come segue:
# larghezza in pixel: 512
# altezza in pixels: 256
	.data

# abbiamo 4 bytes * 512 (larghezza) = 2048 bytes per riga
# abbiamo 256 righe quindi lo spazio da allocare per il framebuffer
# sarà 2048 * 256 = 524288 -> in esadecimale : 0x80000
frameBuffer: .space 0x80000 

	.text
	.globl main

main:
# Disegnamo un rettangolo di grandezza 25x50 in posizione (100 200)
# NOTA: il sistema di coordinate inizia in (0 0) dall'angolo superiore sinistro del display
# i valori crescono andando verso destra e verso il basso.

	li $a0 100 # X
	li $a1 25 # Larghezza
	li $a2 200 # Y
	li $a3 50 # Altezza

	jal rectangle # Chiama la procedura

	# exit
	li $v0 10
	syscall

rectangle:
	beq $a1 $zero rectangleReturn # larghezza nulla: finito
	beq $a3 $zero rectangleReturn # altezza nulla: finito

	li $t0 0x00ffffff # colore del rettangolo
	la $t1 frameBuffer # entry point del framebuffer

	add $a1 $a1 $a0 # calcola coordinate finali x
	add $a3 $a3 $a2 # calcola coordinati finali y

	sll $a0 $a0 2 # scaliamo la x in bytes (4 bytes per pixel)
	sll $a1 $a1 2
	sll $a2 $a2 11 # scaliamo la y in bytes (512*4 bytes per display row)
	sll $a3 $a3 11

	addu $t2 $a2 $t1 # trasforma i valori Y agli indirizzi iniziali del display
	addu $a3 $a3 $t1
	addu $a2 $t2 $a0 # trasforma i valori Y agli indirizzi iniziali del rettangolo
	addu $a3 $a3 $a0
	addu $t2 $t2 $a1 # e calcola l'indirizzo finale per la prima riga del rettangolo
	li $t4 0x800 # bytes per riga del display row

rectangleYloop:
	move $t3 $a2 # puntatore al pixel corrente per il loop sulla X

rectangleXloop:
	sw $t0 ($t3)
	addiu $t3 $t3 4
	bne $t3 $t2 rectangleXloop # prosegui fino a quando non abbiamo superato la larghezza richiesta

	addu $a2 $a2 $t4 # avanza di una riga per i puntatori di sinistra
	addu $t2 $t2 $t4 # e di destra
	bne $a2 $a3 rectangleYloop # prosegui fino a quando non abbiamo superato l'altezza richiesta

rectangleReturn:
	jr $ra # ritorna al chiamante
