# Cosa fa?
#
# Eseguire e analizzare il codice assembly riportato nel file cosa_fa.asm e descri- vere, 
# in linguaggio di alto livello e aggiungendo commenti al file, le operazioni che esegue.	
	
	.data
v:	.byte 2,0,0,0,4,0,0,0	# questi byte vanno visti come word (x,0,0,0)
array:	.byte 2,0,0,0,3,0,0,0,5,0,0,0,7,0,0,0,11,0,0,0,13,0,0,0,17,0,0,0,19,0,0,0

	.text
	.globl main
main:
	# carico gli indirizzi nei registri
	la $s1 array
	la $s2 v

	
	lw $t0 0($s2)	# load primo elemento v
	addi $t0 $t0 -1	# sottraggo -1 a t0, lo utilizzerò per spostarmi al secondo elemento
	mul $t0 $t0 4	# offset (in bytes)
	add $t1 $s1 $t0	# indirizzo secondo elemento array in t1 (base + offset)
	lw $t2 0($t1)	# carico secondo elemento array in t2
	addi $t2 $t2 1	# incremento secondo elemento array

	lw $t0 4($s2)	# load in t0 secondo elemento v 
	addi $t0 $t0 -1	# decremento di 1, lo utilizzerò per spostarmi 
	mul $t0 $t0 4	# offset 
	add $t3 $s1 $t0 # indirizzo del quarto elemento array in t3
	lw $t4 0($t3)	# carico quarto elemento array in t4
	addi $t4 $t4 -1 # decremento quarto elemento array

	sw $t2 0($t3)	# store in posizione scambiate
	sw $t4 0($t1)	#  

	li $v0 10	
	syscall		# exit
