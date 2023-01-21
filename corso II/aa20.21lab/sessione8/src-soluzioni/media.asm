.data

voti: 0

.globl main
.text

main:
	la $a0 voti
	jal media
	
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
media:
	# somma = numero = 0;
	#
	# for (i=0; voti[i]!=0; i++) {
	#     somma += voti[i];
	#     numero ++;
	# }
	#
	# reutrn somma / numero
	
	li $t0 0     # t0 è SOMMA
	li $t1 0     # t1 è NUMERO (di elementi)
	
	# a0 è l'INDIRIZZO di voti[i], cioe' all'inizio voti[0], e incrementa di 4 ad ogni iterazione
ciclo:	lw $t2 ($a0)   #  t2 è il VALORE di voit[i]
	beqz $t2 fineciclo
	
	add $t0 $t0 $t2  # somma += voti[i]
	addi $t1 $t1 1   # numero ++
	
	add $a0 $a0 4  # per fare i++, incrementiamo a0 di QUATTRO
	j ciclo
fineciclo:
	beqz $t1 vettoreVuoto
	div $v0 $t0 $t1  # calcolo della media
	jr $ra
	
vettoreVuoto:
	li $v0 666  # un valore di ritorno che segnala un caso speciale
	jr $ra
	
	
	