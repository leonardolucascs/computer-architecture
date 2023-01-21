	.data
	string1: .asciiz "Inserisci codice operazione: 1 (+), 2 (-), 3 (*), 4 (/): "
	string2: .asciiz "Inserire intero: "
	string3: .asciiz "Risultato: "
	string4: .asciiz " , resto della divisione: "

	.text
	.globl main
main:

	li $v0, 4		# print_string
	la $a0, string1		# $a0 contiene l'indirizzo di string1
	syscall

	li $v0, 5		# read_int
	syscall
	add $s0, $v0, $zero	# $s0 = $v0
	
	# leggo primo operando ($t1)	
	li $v0, 4		# print_string
	la $a0, string2
	syscall
	li $v0, 5		# read_int
	syscall
	add $t1, $v0, $zero

	# leggo secondo operando ($t2)
	li $v0, 4		# print_string
	la $a0, string2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	
	move $a0, $t1	# primo operando in $a0
	move $a1, $t2	# secondo operando in $a1
	move $a2, $s0	# codice operazione in $a2
	
	jal elaboratore
	
	# ora $v0 contiene risultato dell'operazione
	
	move $t0, $v0
	
	# stampo il risultato
	li $v0, 4		# print_string
	la $a0, string3
	syscall
	li $v0, 1
	add $a0,$zero,$t0
	syscall

	bne $s0, 4, Exit	# se non era una divisione ho finito (Exit)
	# Se era una division e non c'è resto ho finito (Exit)
	beq $v1, $zero, Exit
	
	# Se era una divisione e c'è resto lo stampo
	li $v0, 4		# print_string
	la $a0, string4
	syscall
	li $v0, 1
	add $a0,$zero,$v1
	syscall
	
Exit:
	li $v0, 10	# Exit
	syscall	

# -------------------------------------------
# Procedura elaboratore

elaboratore:
	# seleziono l'operazione da eseguire
	addi $a2, $a2, -1
	beq $a2, $zero, Sum
	addi $a2, $a2, -1
	beq $a2, $zero, Diff
	addi $a2, $a2, -1
	beq $a2, $zero, Mul
	addi $a2, $a2, -1
	beq $a2, $zero, Div
	j End	
Sum:
	add $v0, $a0, $a1
	j End
Diff:
	sub $v0, $a0, $a1
	j End
Mul:
	mul $v0, $a0, $a1
	j End
Div:
	div $a0, $a1
	mflo $v0
	mfhi $v1
End:
	jr $ra
