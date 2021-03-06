
%Ejercicio 9
%Todos los elementos de L1 <= L 

pertenece(X, [Y|T]) :- X = Y; pertenece(X, T).
pertenece_y_elimina(X, [Y|T], Z) :- 
(X = Y, Z=T); 
(pertenece_y_elimina(X, T, P) , Z=[Y|P]).

menorALista(X,[]).

menorALista(X, [Y|L]):-
X < Y,
menorALista(X,L).


partir(L, Menores, Mayores):-
pertenece_y_elimina(Neutro,L,L1),
partirRec(L1,Menores,Mayores, Neutro).

partirRec([],[],[],Z).

partirRec([Elemento|L], Menores, Mayores, Neutro):-
Elemento =< Neutro,
Menores= [Elemento|Restomenores],
partirRec(L,Restomenores,Mayores,Neutro).

partirRec([Elemento|L], Menores, Mayores, Neutro):-
Elemento >= Neutro,
Mayores= [Elemento|Restomayores],
partirRec(L,Menores,Restomayores,Neutro).


%Ejercicio 10

quicksort([],[]).

quicksort(Lista, ListaOrdenada):-
pertenece_y_elimina(Neutro,Lista,ListaSinNeutro),
partirRec(ListaSinNeutro,Menores,Mayores,Neutro),
quicksort(Menores, Menoresordenados),
quicksort(Mayores, Mayoresordenados),
Sub1=[Neutro|Mayoresordenados],
append(Menoresordenados,Sub1,ListaOrdenada).

%Ejercicio 11

listaOrdenada([]).


listaOrdenada([Elem|L]):-
listaOrdenadaRec(L,Elem).

listaOrdenadaRec([],X).
listaOrdenadaRec([Elem|L],Arriba):-
Arriba =< Elem,
listaOrdenadaRec(L,Elem).

pertenece_y_elimina(X, [Y|T], Z) :- 
(X = Y, Z=T); 
(pertenece_y_elimina(X, T, P) , Z=[Y|P]).

igualesElem(L1,L2):-
length(L1,Z),
length(L2,Z),
igualesElemRecursivo(L1,L2).

igualesElemRecursivo([],Z).

igualesElemRecursivo([X|Lista1],[Y|Lista2]):-
X=Y,
igualesElemRecursivo(Lista1,Lista2).

igualesElemRecursivo([X|Lista1],Z):-
dif(X,Y),
pertenece_y_elimina(X,Z,Elim),
igualesElemRecursivo(Lista1,Elim).


merge_sort([],[]).
merge_sort([X|[]],[X|[]]).

merge_sort(Lista, ListaOrdenada):-
append(L1,L2,Lista), dif(L1,[]), dif(L2,[]),
merge_sort(L1, L1Ordenado),
merge_sort(L2, L2Ordenado),
merge(L1Ordenado,L2Ordenado,ListaOrdenada).

merge(L1,L2,Ordenado):-
append(L1,L2,Mezcla),
igualesElem(Mezcla,Ordenado),
listaOrdenada(Ordenado).


%Ejercicio 12
%eval(5 * x ** 2 + 1, 4, R).

monomio(C):- integer(C).
monomio(x).
monomio(C*x):- integer(C).
monomio(C*x**E) :- integer(C), integer(E).
polinomio(M+P) :- monomio(M), monomio(P).
polinomio(M-P) :- monomio(M), monomio(P).
polinomio(M+P) :- monomio(M), polinomio(P).
polinomio(M+P) :- polinomio(M), monomio(P).

eval(C, _, C):- integer(C).
eval(C*x, Valor, Resultado):- Resultado is C * Valor.
eval(C*x**E, Valor, Resultado):- Resultado is C * Valor ** E.

eval(Z,Valor,Resultado):-
polinomio(Z) = polinomio(M+P),
eval(M,Valor,R1),
eval(P,Valor,R2),
Resultado is R1+R2.

eval(Z,Valor,Resultado):-
polinomio(Z) = polinomio(M-P),
eval(M,Valor,R1),
eval(P,Valor,R2),
Resultado is R1-R2.

















