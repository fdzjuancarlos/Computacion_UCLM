%caso de estudio

:- dynamic clausula/1, clausula/2.
%clausula(X).
%% clausula(p; q).
%clausula(not(p); q).
%clausula(p; not(q)).
%clausula(not(p); not(q)).

%%
clausula(p;q;r).
clausula(p;not(q)).
clausula(not(r);not(q)).
clausula(not(p);r).

%
%clausula(not(p)).
%clausula(p;q).

% Resolutor hace la parte principal de aplicar el mecanismo de resolucion lineal. Usa reglas auxiliares.

resolutor:- clausula(X), resolutor(X, []), !.
resolutor(X, L):- clausula(Y), (resolutor(X,Y,L); resolutor(Y,X,L)).
resulutor(X, L):- recorrer(X, L, L).

resolutor(X, not(X), _):- write(encontrado).

resolutor(not(X), (X;Y), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).
resolutor(not(X), (Y;X), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).

resolutor(X, (not(X);Y), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).
resolutor(X, (Y;not(X)), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).


resolutor((X;Y), (not(X);Z), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((X;Y), (Z;not(X)), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).

resolutor((Y;X), (not(X);Z), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((Y;X), (Z;not(X)), L):- repeticion(Y, Z, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).


resolutor((Y;X;Z), not(X), L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).
resolutor((Y;not(X);Z), X, L):- (clausula(Y); esta(Y, L)), !, fail; resolutor(Y, [L|Y]).


resolutor((Y;X;Z), (not(X); M), L):- repeticion((Y;Z), M, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((Y;X;Z), (M; not(X)), L):- repeticion((Y;Z), M, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).

resolutor((Y;not(X);Z), (X; M), L):- repeticion((Y;Z), M, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((Y;not(X);Z), (M; X), L):- repeticion((Y;Z), M, C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).


resolutor((Y;X;Z), (not(X); M; N), L):- repeticion((Y;Z), (M;N), C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).

resolutor((X;Y;Z), (M; not(X); N), L):- repeticion((Y;Z), (M;N), C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((Y;X;Z), (M; not(X); N), L):- repeticion((Y;Z), (M;N), C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).
resolutor((Y;Z;X), (M; not(X); N), L):- repeticion((Y;Z), (M;N), C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).

resolutor((Y;X;Z), (M; N; not(X)), L):- repeticion((Y;Z), (M;N), C), (clausula(C); esta(C, L)), !, fail; resolutor(C, [L|C]).


% Recorrer recorre la lista de .......

(_, [], _):- false.
recorrer(X, [Y|R], L):- resolutor(X,Y,L); resolutor(Y,X,L); recorrer(X,R,L).

% Repeticion se asegura de que no se incluyen clausulas del tipo (p;p;q).

repeticion(X,X,X).

repeticion((X;Y), X, Y). 
repeticion((Y;X), X, Y).

repeticion((X;Y), (X;Z), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).
repeticion((X;Y), (Z;X), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).
repeticion((Y;X), (Z;X), S):- ((repeticion(Y,Z,S1); repeticion(Z,Y,S1)), S=(X;S1)) ; S=(X;Y;Z).

repeticion(X,Y,(X;Y)).

% Esta comprueba que una clausula esta ya añadida a la lista de .........

esta(_, []):- false.
esta(X, [X|_]):-!.
esta(X, [_|R]):- esta(X,R).
