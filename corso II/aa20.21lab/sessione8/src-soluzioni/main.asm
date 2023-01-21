# input:
#   a0: la stringa S di cui contare le a
# output:
#   v0: il numero di a contate
.data
unaStringa: .space 100
.globl main
.text

main:
	la $a0 unaStringa
	li $a1 100
	li $v0 8 
	syscall       # read( $a0 )  // massima lunghezza = 100
	
	jal conta_a   #  $v0 = conta_a( $a0 ) ;
	
	move $a0 $v0
	li $v0 1
	syscall       # print( $v0 )

	li $v0 10
	syscall       # exit

conta_a:
	move $t0 $fp
	addi $fp $sp -4
	
	sw $t0   0($fp)
	sw $sp  -4($fp)
	sw $ra  -8($fp)
	sw $s4 -12($fp)
	
	addi $sp $fp -12

	# if S == ""  then return 0  --->    S[0] == 0
	li $v0 0
	lb $t3 ($a0)   # t3 = il (codice ASCII de) il primo carattere della stringa
	beqz $t3 epilogo
	
	seq $s4 $t3 'a'   # s4 vale 0 se $t3 non è 'a', e vale 1 se è 'a'
	                  # s4 = (t3 == 'a')  ;
	                  # s4 = (t3 == 'a')? 1 : 0 ; 	
	add $a0 $a0 1
	jal conta_a
	add $v0 $v0 $s4

epilogo:	lw $t0  0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s4 -12($fp)
	
	move $fp $t0
	jr $ra


