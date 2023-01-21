.globl reverseArray

.text

# reverseArray:
#   a0 : indirizzo di (primo elemento dell) array A  (da invertire)
#   a1 : indirizzo di (primo elemento dell) array B  (già allocato da qualche parte)
#   a2 : numero di elementi di  entrambi gli array
reverseArray:
	# t1 = a1 + ( a2 - 1 ) * 4   cioè  t1 è la posizione dell'ultimo el di B
	add $t1 $a2 -1   # t1 = a2 - 1
	sll $t1 $t1 2    # t1 = (a2-1)*4
	add $t1 $t1 $a1  # t1 = a1+(a2-1)*4
	
ciclo:	blt $t1 $a1 fineCiclo

	lw $t0 ($a0)
	sw $t0 ($t1)   #  
	
	add $a0 $a0  4
	add $t1 $t1 -4
	
	j ciclo
	
	# for (i=0 i<a2 i++) B[i] = A[a2-1-i]  
fineCiclo:	jr $ra
	