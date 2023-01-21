	.data
str1: .asciiz "Inserire 3 interi: "
str2: .asciiz "a: "
str3: .asciiz "b: "
str4: .asciiz "c: "
str5: .asciiz "errore"

	.text
	.globl main
main:

	li $v0 4 # print_string
	la $a0 str1
	syscall
	
	li $v0 4 # print_string
	la $a0 str2
	syscall
	
	li $v0 5 # read_int
	syscall
	add $t0 $zero $v0
	
	li $v0 4 # print_string
	la $a0 str3
	syscall
	
	li $v0 5 # read_int
	syscall
	add $t1 $zero $v0	
	
	li $v0 4 # print_string
	la $a0 str4
	syscall
	
	li $v0 5 # read_int
	syscall
	add $t2 $zero $v0

If:	
	slt $t3 $t0 $t1
	bne $t3 $zero Else # if $t3==0 salta a Else
	beq $t2 $zero Else

Then:	
	add $t3 $t0 $t1
	mult $t3 $t2
	mflo $t3
	
	li $v0 1 # print_int	
	move $a0 $t3
	syscall
	j end
	
Else:		
	li $v0 4 #  print_string
	la $a0 str5
	syscall
	
end:
	li $v0 10
	syscall
