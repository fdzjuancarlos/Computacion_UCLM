

monomio(C) :- integer(C).			eval(C,V,C)
monomio(x) :- 					eval(x,V,V)
monomio(C*x) :- integer(C). 			eval(C**,V,R):- R is C*V	
monomio(C*x**E) :- integer(C), integer(E).
polinomio(M+P) :- monomio(N), monomio(P).
polinomio(M-P) :- monomio(M), momomio(P).
