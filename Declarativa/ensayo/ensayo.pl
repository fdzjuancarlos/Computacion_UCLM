%Ensayo

p:-q,r,z.
q:-s.
s:-true.
r:-true.
z:-true.
solve(true).
solve((X,Y)):- clause(X,A), solve(A), solve(Y).
solve(X):- clause(X,A), solve(A).


:- op(400,xfx,v).
:- op(400,xfx,and).
:- op(300,fx,¬).
:- op(500,xfx,--->).

:-dynamic and/2.
:-dynamic (¬)/1.
:-dynamic v/2.
:-dynamic (--->)/2.
¬(X):- not(X).
and(X,Y):- X,Y.
v(X,Y):- X;Y.
--->(X,Y):- asserta(Y:-X).

