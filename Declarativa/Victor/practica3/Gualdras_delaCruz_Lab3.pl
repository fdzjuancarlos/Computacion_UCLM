%Ejercicio 9

partir(L, L1, L2) :- member(X,L), misus(X,L,Lm), partir3(X, Lm, L1, L2).

partir2([],L,L1,L2).
partir2(L, L1, L2) :- misus(X,L,Lm), partir3(X, Lm, L1, L2), partir2(Rx, L, L1, L2).


partir3(X,[],[],[]).
partir3(X, [P|Rp], [P|Rq], L2) :- P=<X, partir3(X,Rp,Rq, L2).
partir3(X, [P|Rp], L1, [P|Rq]) :- P>X, partir3(X,Rp,L1, Rq).


misus(X, [X|Rx], Rx) :- !.
misus(X, [Z|Rx], [Z|Ry]) :- misus(X, Rx, Ry).
