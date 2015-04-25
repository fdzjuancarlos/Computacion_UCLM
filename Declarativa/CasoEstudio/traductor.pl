





:- op(400,xfx,v).
:- op(400,xfx,&&).
:- op(300,fx,¬).
%:- op(500,xfx,--->).

%:-dynamic &&/2.
:-dynamic (¬)/1.
:-dynamic v/2.
%:-dynamic (--->)/2.

¬(X):- not(X).
&&(X,Y):- X,Y.
v(X,Y):- X;Y.
%--->(X,Y):- asserta(clausula(not(X);Y)).

formula2clausula(Formula):-f2c(Formula,Clausula),
term_to_atom(Termino,Clausula),
asserta(clausula(Termino)).

f2c(X > Y, Clausula):-!, f2c(X,X2), f2c(Y,Y2),
term_to_atom(X3,X2), term_to_atom(Y3,Y2),
term_to_atom(not(X3);Y3,Clausula).

f2c(X v Y, Clausula):-!, f2c(X,X2), f2c(Y,Y2),
term_to_atom(X3,X2), term_to_atom(Y3,Y2),
term_to_atom(X3;Y3,Clausula).

f2c(X && Y, Clausula):-!, f2c(X,X2), f2c(Y,Y2),
term_to_atom(X3,X2), term_to_atom(Y3,Y2),
term_to_atom(not(not(X3);not(Y3)),Clausula).

f2c(¬ X, Clausula):-!, f2c(X,X2), 
term_to_atom(X3,X2),
term_to_atom(not(X3),Clausula).

f2c(X, Clausula):- term_to_atom(X,Clausula).
%%%%%%%%%%%%%%%%%%%%%PARTE ANTIGUA DE RESOLUTOR, SOLO PARA HACER PRUEBAS%%%%%%%%%%%%%%%%
%caso de estudio

:- dynamic clausula/1, clausula/2.
%clausula(X).
%clausula(p; q).
%clausula(not(p); q).
%clausula(p; not(q)).
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


