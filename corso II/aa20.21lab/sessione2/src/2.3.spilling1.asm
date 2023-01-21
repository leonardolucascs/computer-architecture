# Spilling di registri
#
# Si supponga di poter usare soltanto i registri $s0 e $t0. Si scriva il codice assembly che:
# • calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno moltiplicato per 3;
# • non si utilizzi la pseudo-istruzione mul(? mul: è una basic instruction!).

	.text
	.globl main
	
main:
	li $s0 3	# uso $s0 per la somma parziale, inizializzo a 3 (1*3)
	
	add $sp $sp -4	# faccio spazio sullo stack
	sw $s0 0($sp)	# salvo primo addendo nello stack (push)
	
	# secondo numero
	li $s0 2
	li $t0 3
	mult $s0 $t0
	mflo $t0	# salvo in t0 il prodotto
	
	lw $s0 0($sp)	# carico in s0 cima stack
	addi $sp $sp 4  # aggiorno lo stack pointer (pop)
	
	add $s0 $s0 $t0	# prima somma parziale
	
	# prima somma parziale sullo stack
	add $sp $sp -4
	sw $s0 0($sp)
	
	# terzo numero
	li $s0 3
	li $t0 3
	mult $s0 $t0
	mflo $t0
	
	lw $s0 0($sp)
	addi $sp $sp 4	# pop
	
	add $s0 $s0 $t0	# seconda somma parziale
	
	li $v0 10
	syscall