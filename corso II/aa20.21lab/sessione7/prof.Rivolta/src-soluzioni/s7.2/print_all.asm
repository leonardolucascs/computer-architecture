	.data
sep: 	.asciiz " "
begin: 	.asciiz "[ "
end:	.asciiz " ]\n" 

	.text
	.globl print_all
# INPUT
# $a0: indirizzo base del vettore
print_all:
	move $t0 $a0   # $t0: indirizzo base del vettore
	lw $t1 0($t0)
	
	li $v0 4
	la $a0 begin
	syscall
	
	# indirizzo del primo numero nel vettore
	addi $t2 $t0 8
loop:
	beq $t1 $zero end_loop
	# stampa numero
	lw $a0 0($t2)
	li $v0 1
	syscall
	# stampa separatore
	li $v0 4
	la $a0 sep
	syscall
	
	# calcolo indirizzo del prossimo elemento (potenziale se sono alla fine)
	addi $t2 $t2 4 
	# decremento contatore
	addi $t1 $t1 -1
	
	j loop

end_loop:	
	
	li $v0 4
	la $a0 end
	syscall
	
	jr $ra
	 