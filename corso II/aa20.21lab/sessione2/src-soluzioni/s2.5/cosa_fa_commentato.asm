	.data
v:	.byte 2,0,0,0,4,0,0,0
array:	.byte 2,0,0,0,3,0,0,0,5,0,0,0,7,0,0,0,11,0,0,0,13,0,0,0,17,0,0,0,19,0,0,0

	.text
	.globl main
main:
	# scambia!

	la $s1 array # carico gli indirizzi
	la $s2 v

	lw $t0 0($s2) # load valore 2
	addi $t0 $t0 -1	# sottraggo 1 perchè indirizzerà il secondo elemento
	mul $t0 $t0 4 # offset (in bytes)
	add $t1 $s1 $t0 # indirizzo secondo elemento array (base + offset)
	lw $t2 0($t1) # load secondo elemento array
	addi $t2 $t2 1 # incremento secondo elem ento array

	lw $t0 4($s2) # load valore 4
	addi $t0 $t0 -1	# sottraggo 1 perchè indirizzerà il quarto elemento
	mul $t0 $t0 4 # offset (in bytes)
	add $t3 $s1 $t0 # indirizzo quarto elemento array (base + offset)
	lw $t4 0($t3) # load quarto elemento array
	addi $t4 $t4 -1	# decremento quarto elemento array

	sw $t2 0($t3) # store in posizioni scambiate
	sw $t4 0($t1)

	li $v0 10 # exit
	syscall
