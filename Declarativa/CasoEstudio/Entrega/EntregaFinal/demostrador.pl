



%caso de estudio

:- dynamic clausula/1, clausula/2.

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


recorrer(_ , [] , _):- false.
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

% Traductor

:- op(400,xfx,v).
:- op(400,xfx,&&).
:- op(300,fx,¬).
%:- op(500,xfx,--->).

%:-dynamic &&/2.
:-dynamic (¬)/1.
:-dynamic v/2.

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

%predicado inicializador de la entrada de datos

input(File):-
         %abre el archivo a leer en Str
         open(File,read,Str),
         %lee Str por lineas y las almacena en la lista L
         read_line(Str,L),
         %para cada elemento de L, ejecuta formulatoclausula
         forall(member(E,L),formula2clausula(E)),
         %llama al resolutor
         resolutor,
         %cierra Str
         close(Str).




%si ha terminado de leer para   

read_line(Stream,[]):-
         at_end_of_stream(Stream).
   


%si no ha terminado de leer lee otra linea

read_line(Stream,[X|L]):-
         %comprueba si ha terminado de leer
         \+  at_end_of_stream(Stream),
         %lee un elemento de Stream
         read(Stream,X),
         %vuelve a llamar a read_line
         read_line(Stream,L). 
