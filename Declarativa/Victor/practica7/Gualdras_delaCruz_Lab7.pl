%Ejercicio 27

libro(ID, autor(A, N), titulo(T), editorial(E), prestado(P,fecha(D,M,A))).

autor(A, N).
titulo(T).
editorial(E).
prestado(P,fecha(D,M,A)).

ficha(T(H)):- write(T), ficha(H).
ficha(H):- write(H).
