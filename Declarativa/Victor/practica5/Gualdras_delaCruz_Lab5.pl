%%%%%%%%%%%%%%Borrar T1, T2 de speedup%%%%%%%%%%%%%%%%%

%Ejercicio17

speedup(S, G1, G2, T1, T2) :- speed(G1, T1), speed(G2,T2), S is T2/T1.

speed(G, T) :- T1 is cputime, call(G), T2 is cputime, T is T2 - T1.


%Ejercicio19
% longitud1(L,N), N es la longitud de la lista L

longitud1([],0).
longitud1([H|T],N) :- longitud1(T,Z), N is Z +1.

% longitud2(L,N) es la versión eficiente con parametros de acumulacion.

longitud2(L,N) :- longitud2(L,0,N).

longitud2([], A, A).
longitud2([X|Rx], A, N) :- NewA is A+1, longitud2(Rx, NewA, N).

%Ejercicio21
%Modo ineficiente fib(N, F): 

fib(1,1).
fib(2,1).
fib(N,F) :- N>2, H1 is N-1, H2 is N-2, 
	fib(H1,F1),fib(H2,F2), 
	F is F1+F2.


%Modo eficiente
fib2(N,Fibonacci) :- fib2(N,Fibonacci,2,1,1).

%Fibonacci(N,Fibonacci,I,Fn1,Fn2)

fib2(N,Fibonacci,I,Fibonacci,_) :- I>=N.
fib2(N,Fibonacci,I,Fn1,Fn2) :- I<N, 
	NewF is Fn1 + Fn2, NewFn2=Fn1, 
	NewFn1=NewF, 
	NewI is I+1, 
	fib2(N,Fibonacci,NewI,NewFn1,NewFn2).

