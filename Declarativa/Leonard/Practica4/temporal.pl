
%Ejercicio 14
% esRosadelfa(O), el objeto O es una rosadelfa.

esRosadelfa(nil).
esRosadelfa(hoja(_)).
esRosadelfa(nodo(_, Rosadelfas)) :- esListaRosadelfas(Rosadelfas).

esRosadelfa(nil,N):- N is 1.
esRosadelfa(hoja(_), N):- N is 1.
esRosadelfa(nodo(_,Rosadelfas), N) :- esListaRosadelfas(Rosadelfas, X), N is X+1. 

esListaRosadelfas([R]) :- esRosadelfa(R).
esListaRosadelfas([R|Rosadelfas]) :- esRosadelfa(R), esListaRosadelfas(Rosadelfas).

esListaRosadelfas([R], N) :- esRosadelfa(R,N).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,X), esListaRosadelfas(Rosadelfas,Y),
(X >= Y,N is X).
esListaRosadelfas([R|Rosadelfas], N) :- esRosadelfa(R,X), esListaRosadelfas(Rosadelfas,Y),
(X < Y,N is Y).

%Ejercicio 15 Peso

peso(nil, P):- P is 0.
peso(hoja(_), P):- esRosadelfa(hoja(_),P).
peso(nodo(_,Rosadelfas), P) :- esListaRosadelfasPesada(Rosadelfas, X), P is  X+1.

esListaRosadelfasPesada([R], N) :- peso(R,N).
esListaRosadelfasPesada([R|Rosadelfas], N) :- peso(R,X), 
esListaRosadelfasPesada(Rosadelfas,Y),
N is X+Y.
