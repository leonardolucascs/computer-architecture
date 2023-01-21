# Store and sum
# Si scriva il codice Assembly che:
# • metta il valore 5 nel registro $s1;
# • metta il valore 7 nel registro $s2;
# • metta la somma dei due nel registro $s0.

	.text	# specifica che tutte le righe successive son salvate tutte nel text-segment
	.globl main
main:
	addi $s1, $zero, 5
	addi $s2, $zero, 7
	add $s0, $s1, $s2
