.data
la_stringa: .space 9

.text
main:
	li $v0 5
	syscall
	
	move $a1 $v0
	la $a0 la_stringa
	jal toBinary
	
	li $v0 4
	syscall
	
	li $v0 10
	syscall

# funz converti in binario
#  prende in a0 la stringa da scrivere (di 9 bytes!) -- già allocata!
#  e in a1 il numero da convertire

toBinary:	
	sb $zero 8($a0)  # mettiamo il TERMINATORE (la guardia) della stringa in fondo

	li $t1 2         # LA BASE

	li $t0 7     # t0: la lettera della stringa in cui scrivere
ciclo:
	div $a1 $t1      # il RESTO va in Hi.  Il quoziente (intero) va in Low
	mfhi $t2         # ora t2 vale 0 oppure 1
	addi $t2 $t2 '0' # ora t2 è (il codice ASCII de) la lettera della cifra corrispondete ('0' oppure '1'
	add $t6 $a0 $t0
	sb $t2 ($t6)
	mflo $a1         # a1 contiene il rimanente del numero da convertire
	
	addi $t0 $t0 -1
	bgez $t0 ciclo
	
	jr $ra
	
