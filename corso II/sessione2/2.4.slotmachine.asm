# Semplice slotmachine con syscall
#
# Utilizzando le syscall rese disponibili dall’emulatore MARS implementare un programma che:
# Richieda all’utente attraverso una finestra di dialogo l’inserimento di un numero intero NUM
# • Estragga un numero casuale R nel range [-NUM,NUM], (il seed del generatore di numeri casuali 
#   può essere inizializzato con un qualsiasi numero intero)
# • Sommi R al numero inserito NUM : RESULT = NUM + R
# • Mostri all’utente attraverso una nuova finestra di dialogo il nuovo credito dell’utente 
#   dopo la scommessa (RESULT).

	.data
in_msg:	.asciiz "Quanti $ vuoi scommettere?"
out_msg:.asciiz "Ora possiedi: $"

	.text
	.globl main
main:
	la $a0 in_msg # Carica l'indirizzo della stringa di richiesta in $a0
	li $v0 51 # Carica il codice della syscall "InputDialogInt" in $v0
	syscall

	move $t0 $a0 # Sposta l'intero letto da $a0 in $t0
	
	mul $t1 $t0 2 # $t1 = $t0 * 2
	add $t1 $t1 1 	

	# Il generatore di numeri casuali estrae un numero tra 0
	# e un limite massimo (ESCLUSO) per ottenere un numero casuale
	# tra -num e +num dovremo estrarre un numero casuale tra [0 e (2 * num + 1)]
	# dopo di che sottrarre al numero estratto il valore di num

	li $a0 0 # Imposta il seed del generatore a 0, non è il lower bound
	move $a1 $t1 # Carica l'upper bound per il generatore in $a1			
	li $v0 42 # Carica il codice della syscall "random int range"
	syscall

	move $t2 $a0 # Sposta in $t2 il numero casuale generato

	# Sottraiamo il valore inserito dall'utente dal numero casuale estratto
	# per riportare il numero casuale dal range [0 2 * num]
	# nel range [-num num]
	sub $t2 $t2 $t0

	add $t3 $t0 $t2	# Somma il numero casuale estratto al valore inserito dall'utente
			
	la $a0 out_msg # Carica l'indirizzo del messaggio di risposta in $a0
	move $a1 $t3 # Carica l'intero da stampare in $a1
	li $v0 56 # Carica il codice della syscall "MessageDialogInt" in $v0
	syscall

	li $v0 10 # exit
	syscall
