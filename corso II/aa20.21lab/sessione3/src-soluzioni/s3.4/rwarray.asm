# Autore: Andrea Ferretti
# Rivisto in Marzo 2017 --nb
# Rivisto in Marzo 2020 --nb

	.data
string: .asciiz "inserisci un intero: "
string1: .asciiz "comando non riconosciuto: "
.align 2	
array:	.word 0 1 2 3 4 5 6 7 8 9 10 11 12
A: 	.space 4
B: 	.space 4
C: 	.space 4

	.text
	.globl main
main:
	la $s0 array
	la $s1 A
	la $s2 B
	la $s3 C
	addi $t0 $zero 0
	add $t1 $s1 $zero

Label:
	li $v0 4
	la $a0 string
	syscall
	li $v0 5
	syscall
	sw $v0 0($t1)
	addi $t1 $t1 4
	addi $t0 $t0 1
	addi $t2 $zero 3
	slt $t3 $t0 $t2
	bne $t3 $zero Label # finito input utente

	lw $t0 0($s3) # t0 = c
	lw $t1 0($s1)
	addi $t2 $zero 4 # t2 = 4
	mul $t1 $t1 $t2
	add $t1 $t1 $s0
	lw $t3 0($t1) # t3 = a-esimo elemento. t1 indirizzo array[a]
	lw $t4 0($s2)
	mul $t4 $t4 $t2
	add $t4 $t4 $s0
	lw $t5 0($t4) # t5 = b-esimo elemento. t4 inddirizzo array[b]

	bne $t0 $zero Secondo # primo if
	sw $t3 0($t4)
	sw $t5 0($t1)
	j Fine
Secondo:
	addi $t2 $zero 1
	bne $t0 $t2 Terzo # secondo if
	sw $t3 0($t4)
	j Fine
Terzo:
	addi $t2 $zero -1
	beq $t0 $t2 Else # terzo if
	li $v0 4
	la $a0 string1
	syscall
	j Fine
Else:
	sw $t5 0($t1)
Fine:
