# [Sessione 5] Procedure annidate e ricorsive

## [s5.1] Prodotto con somme

*nome del file sorgente: prodottoConSomme.asm*

Si implementino le seguenti procedure.

Procedura `somma`:

- Input: due interi `a` e `b`

- output: la somma `a+b`

Procedura `prodotto_s`

- input: due interi `a` e `b`
- output: il prodotto `a*b`

la procedura `prodotto_s` **non** utilizzi istruzioni di moltiplicazione (`mult` et simila), ma calcoli il prodotto effettuando chiamate multiple alla procedura `somma`

### Esempio 

Il prodotto 3x2 è svolto come 3+3 oppure 2+2+2

## [s5.2] Calcolo ricorsivo del fattoriale e della serie di Fibonacci

*nome del file sorgente fattorialeFibonacci.asm*

Si scriva un programma che, dato un intero positivo *n*, stampi a video il fattoriale di *n* e l’*n*-esimo numero di Fibonacci *F(n)* dove *F(n)=*

- *F(n) = F(n-2)* + *F(n-1)*, se *n > 2*;
- *F(n) =1*, se *n=2*;
- *F(n) =0*, se *n=1*.

Il calcolo del fattoriale e del numero di Fibonacci venga operato con l’uso di procedure ricorsive.

## [s5.3] Stampa in ordine

*nome del file sorgente: stampaInOrdine.asm*

Si scriva un programma che dato un array di interi inserito dall’utente, stampi gli elementi dell’array in ordine dal più grande al più piccolo. Nell’implementazione si definiscano e si usino procedure con specifiche conformi a questi due punti:

- `trovamax`: restituisce l'indice del massimo elemento di un array di interi;
- `printarray`: stampa gli elementi di un array.

## [s5.4] Somma ricorsiva degli elementi in un array

*nome del file sorgente somma_ricorsiva.asm*

Si implementi una procedura ricorsiva `S` che prenda in input un array e il numero di elementi di quell’array e restituisca la somma di tutti gli elementi dell’array. 
Si usi come riferimento il seguente codice sorgente C:

```c
int S(int arr[], int dim){
	if (dim==0) // caso base: array vuoto
		return 0;
	else // step ricorsivo
		return S(arr, dim-1) + arr[dim-1];
}
```

## [s5.5] Stampa array al contrario (ricorsivo)

*nome del file sorgente stampaContrario.asm*

Si scriva un programma che dato un array di interi stampi l’array al contrario (dall’ultimo numero nell’array al primo). Il programma faccia uso di una procedura ricorsiva.

## [s5.6] Compact list

*nome del file sorgente: compactList.asm*

Si supponga di avere nel segmento dati:

- Un array `list` che possa contenere un numero massimo di 128 elementi
- Una variabile `HEAD` che indica la prima posizione libera in testa alla lista

Si implementino le seguenti procedure:

- `insert`: inserisce un elemento in testa alla lista
- `delete`: cancella un elemento arbitrario della lista e ricompatta l’array
