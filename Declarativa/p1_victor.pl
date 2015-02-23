%%% HECHOS

padre(abraham,isaac).
padre(abraham,ismael).


padre(haran,lot).
padre(haran,melca).
padre(haran,jesca).

padre(teraj,habraham).
padre(teraj,najor).
padre(teraj,haran).
padre(teraj,sara).

padre(isaac,esau).
padre(isaac,jacob).

padre(najor,batuel).

padre(batuel,rebeca).
padre(batuel,laban).





madre(agar,ismael).
madre(sara,isaac).
madre(rebeca,esau).
madre(rebeca,jacob).
madre(melca,batuel).



hombre(isaac).
hombre(lot).
hombre(teraj).
hombre(najor)
hombre(haran).
hombre(abraham).
hombre(esau).
hombre(jacob).
hombre(laban).

mujer(melca).
mujer(jesca).
mujer(sara).
mujer(agar).
mujer(rebeca).

casado(abraham,sara).
casado(najor,melca).
casado(isaac,rebeca).

%%% REGLAS

ascendiente_directo(X, Y) :- (padre(X, Y); madre(X, Y)).
ascendiente(X, Z) :- ascendiente_directo(X, Z).
ascendiente(X, Z) :- ascendiente_directo(X, Y), ascendiente(Y, Z).

descendiente_directo(X, Y) :- ascendiente_directo(Y, X).
descendiente(X, Z) :- ascendiente(Z, X).

%descendiente_directo(X, Y) :- (padre(Y, X); madre(Y, X)).
%descendiente(X, Z) :- descendiente_directo(X,Z).
%descendiente(X, Z) :- descendiente_directo(X, Y), descendiente(Y, Z).

hijo(X, Y) :- hombre(X), ascendiente_directo(Y,X).
hija(X, Y) :- mujer(X), ascendiente_directo(Y,X).

abuelo(X, Z) :- (hombre(X), ascendiente_directo(X, Y), ascendiente_directo(Y, Z)).
abuela(X, Z) :- (mujer(X), ascendiente_directo(X, Y), ascendiente_directo(Y, Z)).

hermano(X, Y) :- (hombre(X), ascendiente_directo(Z, X), ascendiente_directo(Z, Y)).
hermana(X, Y) :- (mujer(X), ascendiente_directo(Z, X), ascendiente_directo(Z, Y)).

tio(X, Y) :- (ascendiente_directo(Z, Y), hermano(X, Z)).
tia(X, Y) :- (ascendiente_directo(Z, Y), hermana(X, Z)).

sobrino(X, Y) :- hombre(X), (tio(Y,X); tia(Y,X)).
sobrina(X, Y) :- mujer(X), (tio(Y,X); tia(Y,X)).

primo(X, Y) :- hombre(X), (tio(Z, X); tia(Z, X)), (padre(Z, Y); madre(Z, Y)).
prima(X, Y) :- mujer(X), (tio(Z, X); tia(Z, X)), (padre(Z, Y); madre(Z, Y)).

familia(X, Y) :- (ascendiente(X, Y); descendiente(X, Y); hermano(X, Y); hermana(X, Y); primo(X, Y); prima(X, Y)).

incesto(X, Y) :- casado(X, Y), familia(X, Y).


