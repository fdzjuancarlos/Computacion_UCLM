
%Ejercicio 4

sus(X,Y,[],[]).

sus(X,Y,[X|Sublista],[Y|Sublista2]) :- 
sus(X,Y,Sublista,Sublista2).

sus(X,Y,[P|Sublista],[P|Sublista2]) :- 
dif(X,P),
sus(X,Y,Sublista,Sublista2).

%Ejercicio 5

%append([],X,X).
%append([X|Lista], Y, [X|Z]):- append(X,Y,Z).

aplanar([],[]).
aplanar([[]],[]).

aplanar([[X|Order1]|Order2],[X|Suma]):-
not(is_list(X)),
append(Order1,Order2,Iter),
aplanar(Iter,Suma).

aplanar([X|Order1],Suma):-
is_list(X),
aplanar(X,Aplanado),
append(Aplanado,Order1,Iter),
aplanar(Iter,Suma).

aplanar([X|Order1],[X|Otro]):-
not(is_list(X)),
aplanar(Order1, Otro).


%Ejercicio 6

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

%Ejercicio 7

descomponer(N,A,B) :-
between(1,N,A),
between(1,N,B),
0 is A mod 2,
0 is B mod 2,
N is A+B.


%Ejercicio 8

particion_Brandeth(Cifra,A,B):-
sub_string(Cifra,0,2,_,Astring),
sub_string(Cifra,2,2,_,Bstring),
number_codes(A,Astring),
number_codes(B,Bstring).

numBrandreth(N, C):-
between(32, 99, N),
C is N*N,
particion_Brandeth(C,A,B),
N is A+B.


















