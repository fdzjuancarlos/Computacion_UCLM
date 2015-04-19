%Ensayo

p:-q,r,z.
q:-s.
s.
r.
z.
solve(true).
solve((X,Y)):- clause(X,A), solve(A), solve(Y).
solve(X):- clause(X,A), solve(A).

