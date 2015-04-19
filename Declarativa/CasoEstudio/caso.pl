%caso de estudio

:- dynamic clausula/1, clausula/2.
%clausula(X).
clausula(p; q).
clausula(not(p); q).
clausula(p; not(q)).
clausula(not(p); not(q)).

resolutor:- clausula(X), resolutor(X), !.
resolutor(X):- clausula(Y), resolutor(X,Y).

resolutor(X, not(X)):- write("encontrado").
resolutor(not(X), X):- write("encontrado").

resolutor((X;Y), not(X)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor((X;Y), not(Y)):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

resolutor(not(X), (X;Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor(not(Y), (X;Y)):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

resolutor(X, (not(X);Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor(Y, (X;not(Y))):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

resolutor((not(X);Y), X):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor((X;not(Y)), Y):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

resolutor((X;Y), (not(X);Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor((X;Y), (X;not(Y))):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

resolutor((not(X);Y), (X;Y)):- clausula(Y), !, fail; (assertz(clausula(Y)), resolutor(Y)).
resolutor((X;not(Y)), (X;Y)):- clausula(X), !, fail; (assertz(clausula(X)), resolutor(X)).

