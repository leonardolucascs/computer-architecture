.globl main
.data 
A: 4 0 -2 5
B: .space 16
.text
main:

li $s0 4   # Numero di elementi

# Dove va allocato il vettore B?

## Se volessimo B allocato nello Heap:
#sll $a0 $s0 2  #  $a0 (il numero di byte da allocare) vale $a2 * 4
#li $v0 9
#syscall
#move $a1 $v0    # B è nello HEAP?

## Se invece volessimo B nelle variabili STATICHE
#la $a1 B    

## Se invece volessimo B nello STACK:
addi $a1 $sp -4  # B inizia DOPO lo stack attuale
sll $t1 $s0 2    
subi $sp $sp $t1 # lo stack pointer viene spostato giù di $s0 x 4 bytes

la $a0 A
move $a2 $s0

jal reverseArray

li $v0 10
syscall