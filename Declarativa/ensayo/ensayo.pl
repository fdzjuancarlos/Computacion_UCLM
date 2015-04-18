%Ensayo

p:-q,r,z.
q:-s.
s:-true.
r:-true.
z:-true.
solve(true).
solve((X,Y)):- clause(X,A), solve(A), solve(Y).
solve(X):- clause(X,A), solve(A).

