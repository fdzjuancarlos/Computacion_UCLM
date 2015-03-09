esVacio([]).
esLista([]).
esLista([_|R]) :- esLista(R).
anidada([_|R]) :- not(esVacio(R)).
anidada([R|_]) :- not(esVacio(R)).

%Ejercicio 4

misus(_, _, [], []).
misus(X, Y, [X|Rx], [Y|Ry]) :- misus(X, Y, Rx, Ry).
misus(X, Y, [Z|Rx], [Z|Ry]) :- misus(X, Y, Rx, Ry).

sus(X,Y,L1,L2) :- esLista(L1), misus(X,Y,L1,L2).


%Ejercicio 5
aplanar(Lista, Aplanada) :- esLista(Lista), nueva2(Lista,Aplanada1), borrar(Aplanada1, Aplanada).

igual(X,[X]).

borrar([],[]).
borrar([X|Rx], [X|Ry]) :- not(esVacio(X)), borrar(Rx,Ry).
borrar([X|Rx], Ry) :- esVacio(X), borrar(Rx,Ry).

nueva2(X,Y):- not(anidada(X)), igual(X,Y).
nueva2([X|Rx], Y) :- nueva2(X,P), nueva2(Rx,Q), append(P,Q,Y).


%Ejercicio 6

igualesElem(L1,L2) :- length(L1, L), length(L2, L), iElem(L1,L2).


iElem([],Y).
iElem([X|Rx], Y) :- member(X,Y), iElem(Rx,Y).


%Ejercicio 7

descomponer(N,A,B) :- between(0,N,A), between(0,N,B), N is A+B.




























