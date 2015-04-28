%Ejercicio 27
 
libro(tol85,
 
    autor('Tolkien', 'J.R.R.' ),
 
    titulo('El Señor de los Anillos'),
 
    editorial(minotauro),
 
    prestado(jul101, fecha(28, noviembre, 2004))).
     
ficha(H):-H=libro(L, 
            autor(A,N), 
            titulo(T), 
            editorial(E), 
            prestado(P, fecha(DD,MM,YY))),
            imprimir(L,A,N,T,E,P,DD,MM,YY).
 
imprimir(L,A,N,T,E,P,DD,MM,YY) :-   write('libro:'), nl, tab(8), write(L), write(','), nl,
                                    write('* autor:'), nl, tab(8), write(A), write(','), nl, tab(8), write(N), write(','), nl,
                                    write('* titulo:'), nl, tab(8), write(T), write(','), nl,
                                    write('* editorial:'), nl, tab(8), write(E), write(','), nl,
                                    write('* prestado:'), nl, tab(8), write(P), write(','), nl,
                                    write('** fecha'), nl, tab(8), write(DD), write(','), nl, tab(8), write(MM), write(','), nl, tab(8), write(YY).
 
 
%Ejercicio 28 A
 
unific_a(A,B) :- atomic(A), atomic(B), A=B, !.
 
unific_a(A,B) :- var(A), var(B), A=B, !.
 
unific_a(A,B) :- nonvar(A), var(B), A=B, !.
 
unific_a(A,B) :- var(A), nonvar(B), A=B, !.
 
unific_a(A,B) :- compound(A), compound(B), A=..[F|ArgsA], B=..[F|ArgsB], unific_a_argCola(ArgsA,ArgsB),!.
 
unific_a_argCola([],[]).
unific_a_argCola([A|TA],[B|TB]) :- unific_a(A,B), unific_a_argCola(TA,TB).
 
 
%Ejercicio 28 B
 
unific_b_argCola([],[]).
unific_b_argCola([A|TA],[B|TB]) :- unific_b(A,B), unific_b_argCola(TA,TB).
 
unific_b(A,B) :- atomic(A), atomic(B), unify_with_occurs_check(A,B), !.
 
unific_b(A,B) :- var(A), var(B), unify_with_occurs_check(A,B), !.
 
unific_b(A,B) :- nonvar(A), var(B), unify_with_occurs_check(A,B), !.
 
unific_b(A,B) :- var(A), nonvar(B), unify_with_occurs_check(A,B), !.
 
unific_b(A,B) :- compound(A), compound(B), A=..[F|ArgsA], B=..[F|ArgsB], unific_b_argCola(ArgsA,ArgsB), !.
 
unific_b(X,Y) :- (compound(X); compound(Y)), term_variables(X,Lx), term_variables(Y,Ly), algoIgual(Lx,Ly), !, false.    
 
%comprueba si en 2 listas hay algun elemento igual (que unifica)
algoIgual([Ax|Cx],[Ay|Cy]) :- iAlgun(Ax,[Ay|Cy]); iAlgun(Ay,[Ax|Cx]); algoIgual(Cx,Cy).
     
%indica si hay algun X en la lista [H|T]                    
iAlgun(X,[H|T]) :- (X==H); iAlgun(X,T).
 
%Ejercicio 29 A
 
reduce(List,Func,Base,Result) :- append(List,[Base],Lfinal), composicion(Lfinal,Func,Result).
 
composicion([X],_,X) :- !.
composicion([A|B],F,R) :- composicion(B,F,R1), Ejecuta=..[F,A|[R1,R]], Ejecuta.
 
listaNum([]).
listaNum([A|B]) :- number(A), listaNum(B).
 
%Ejercicio 29 B
 
sum(X,Y,R) :- R is X+Y.
 
sumList(List, Suma) :- listaNum(List), reduce(List,sum,0,Suma).
 
%Ejercicio 29 C
 
mult(X,Y,R) :- R is X*Y.
 
multList(List, Prod) :- listaNum(List), reduce(List,mult,1,Prod).
