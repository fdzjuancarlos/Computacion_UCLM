
%Ejercicio 14
% esRosadelfa(O), el objeto O es una rosadelfa.

%e&sRosadelfa(nil).
%esRosadelfa(hoja(_)).
%esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

%esRosadelfa(nil,N):- N is 1.
%esRosadelfa(hoja(_), N):- N is 1.
%esRosadelfa(nodo(_,Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, X), N is X+1. 

%esListaRosadelfas([R]) :- esRosadelfa(R).
%esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

%esListaRosadelfas([R], N) :- esRosadelfa(R,N).
%esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,X), esListaRosadelfas(Rosadelfas,Y),
%%%(X >= Y,N is X).
%esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,X), esListaRosadelfas(Rosadelfas,Y),
%(X < Y,N is Y).
%%%%%%%%%%%%%%%%%%%%%%%%%%


%Ejercicio 14
% esRosadelfa(O), el objeto O es una rosadelfa.

esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

%a
esRosadelfa(nil,N):- N is 0.
esRosadelfa(hoja(_), N):- N is 1.
esRosadelfa(nodo(_,Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, N1), length(Rosadelfas, N2), mayor(N1,N2,N). 

esListaRosadelfas([R], N) :- esRosadelfa(R,N).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,N1), esListaRosadelfas(Rosadelfas,N2), mayor(N1,N2,N).

mayor(N1,N2,N) :- N1>=N2, N is N1. 
mayor(N1,N2,N) :- N1<N2, N is N2.


%Ejercicio 15 Peso

peso(nil, P):- P is 0.
peso(hoja(_), P):- esRosadelfa(hoja(_),P).
peso(nodo(_,Rosadelfas), P) :- esListaRosadelfasPesada(Rosadelfas, X), P is  X+1.

esListaRosadelfasPesada([R], N) :- peso(R,N).
esListaRosadelfasPesada([R|Rosadelfas], N) :- peso(R,X), 
esListaRosadelfasPesada(Rosadelfas,Y),
N is X+Y.




% construirRosadelfa(L, G, R), construye una rosadelfa R, a partir de los elementos de una lista L.
construirRosadelfa([], _, nil).
construirRosadelfa([X], _, hoja(X)).
construirRosadelfa([X|L], G, nodo(X, [R|Rosadelfas])):- 
partir(L, G, [L1|GListas]),
construirRosadelfa(L1, G, R),
construirRosadelfas(GListas, G, Rosadelfas).

% inspecciona una lista de listas y por cada lista inspeccionada crea una rosadelfa
construirRosadelfas([], _, []).
construirRosadelfas([L|GListas], G, [R|Rosadelfas]) :-
construirRosadelfa(L, G, R),
construirRosadelfas(GListas, G, Rosadelfas).
% partir(L, G, [L1|GListas]), divide la lista L en una secuencia de listas de longitud 
% menor o igual que G, que se devuelve como una lista de listas en el segundo argumento.
partir(L, G, [L]):- length(L,N), N < G.
partir(L, 0, L).
partir(L, G, [L1|GListas]):- length(L,N), N >= G,
G>0,
NuevaLength is N//G,
length(L1, NuevaLength),
append(L1, LL, L),
PorPartir is G-1,
partir(LL, PorPartir, GListas).



