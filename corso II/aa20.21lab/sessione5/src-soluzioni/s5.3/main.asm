	.data
	.align 2
arr:	.word 12 45 -22 -5 12 53 19 21
err_msg: .asciiz "ERRORE!"

	.text
	.globl main
main:
	la $s0 arr # s0<- base address di arr
	move $s2 $s0 # copia che mi servirà alla fine
	li $s1 8 # s1<- numero di elementi in arr
	move $s3 $s1 # copia che mi servirà alla fine
	
	# stampo array iniziale	
	move $a0 $s0
	move $a1 $s1
	jal printarray			
loop:
	ble $s1 $zero end # se non restano elementi da leggere termina

	move $a0 $s0
	move $a1 $s1	
	jal trovamax

	beq $v1 1 err # se trovamax ha generato errore
	
	# swappo max col primo el
	move $a0 $s0
	li $a1 0
	move $a2 $v0
	jal swap

	add $s0 $s0 4
	sub $s1 $s1 1
	j loop
end:
	# stampo array finale	
	move $a0 $s2
	move $a1 $s3
	jal printarray	
exit:
	li $v0 10
	syscall
err:
	li $v0 4
	la $a0 err_msg
	syscall
	j exit