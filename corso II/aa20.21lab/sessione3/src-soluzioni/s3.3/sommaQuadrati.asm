	.data
str1: .asciiz "Inserire Sum: "
str2: .asciiz "Inserire N: "
str3: .asciiz "break "

	.text
	.globl main
main:
	li $v0 4 # print str1
	la $a0 str1
	syscall
	
	li $v0 5 # read_int
	syscall
	add $s0 $zero $v0
	
	# carico il valore iniziale della somma ($t0)
	add $t0 $zero $s0
	
	li $v0 4 # print str2
	la $a0 str2
	syscall
	
	li $v0 5 # read_int
	syscall
	
	# carico N ($s1)	
	add $s1 $zero $v0

	addi $t1 $zero 1 # i
	
for:	
	slt $t2 $t1 $s1	# if i < N then $t2=1 else $t2 = 0
	beq $t2 $zero end
	
	mult $t1 $t1
	mflo $t2 # $t2 = i * i
	
	div $t2 $s0
	mfhi $t3 # $t3 = i*i%5
	beq $t3 $zero Break # if ($t3 == 0) break
	
	add $t0 $t0 $t2
	addi $t1 $t1 1
	j for

Break:
	li $v0 4 # print str1
	la $a0 str3
	syscall
	
end:
	li $v0 1 # print_int
	move $a0 $t0
	syscall
	
	li $v0 10
	syscall
