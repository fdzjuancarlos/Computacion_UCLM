%Ejercicio 9

partir(L, L1, L2) :- member(X,L), misus(X,L,Lm), partir3(X, Lm, L1, L2).

partir2([],L,L1,L2).
partir2(L, L1, L2) :- misus(X,L,Lm), partir3(X, Lm, L1, L2), partir2(Rx, L, L1, L2).


partir3(X,[],[],[]).
partir3(X, [P|Rp], [P|Rq], L2) :- P=<X, partir3(X,Rp,Rq, L2).
partir3(X, [P|Rp], L1, [P|Rq]) :- P>X, partir3(X,Rp,L1, Rq).


misus(X, [X|Rx], Rx) :- !.
misus(X, [Z|Rx], [Z|Ry]) :- misus(X, Rx, Ry).

%Ejercicio 11


%merge_sort(Lista, ListaOrdenada) :- merge(Lista, ListaOrdenada).

%Fallooo
merge_sort(L, L) :- length(L,1), !.
merge_sort(L, O) :- mitad(L, L1, L2), merge_sort(L1, P), merge_sort(L2,Q), ordena(P, Q, O).

ordena([], X, X) :- !.
ordena(X, [], X) :- !.
ordena([X|Rx], [Y|Ry], [X|R]) :- X=<Y, ordena(Rx, [Y|Ry], R), !.
ordena([X|Rx], [Y|Ry], [Y|R]) :- X>Y, ordena([X|Rx], Ry, R), !.

mitad(L, L1, L2) :- length(L, To), T1 is To//2, length(L1,T1), append(L1,L2,L).
