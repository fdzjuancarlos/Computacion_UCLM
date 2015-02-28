% f(a,b) = f(a,X)

padre(teraj,abraham).
padre(teraj,sara).
padre(teraj,najor).
padre(teraj,haran).

padre(abraham,isaac).
padre(abraham,ismael). %madre fue agar

padre(najor,batuel).

padre(haran,lot).
padre(haran,melca).
padre(haran,jesca).

padre(batuel,rebeca).
padre(batuel,laban).

padre(isaac,esau).
padre(isaac,jacob).

madre(agar,ismael).

madre(sara, isaac).

madre(melca,batuel).

madre(rebeca,esau).
madre(rebeca,jacob).

casado(najor,melca).
casado(isaac,rebeca).
casado(abraham,sara).

hombre(haran).
hombre(batuel).
hombre(isaac).
hombre(lot).
hombre(abraham).
hombre(teraj).
hombre(najor).
hombre(esau).
hombre(jacob).
hombre(laban).


mujer(melca). %esposa de najor
mujer(jesca).
mujer(rebeca). %esposa de isaac
mujer(sara). %esposa de abraham
mujer(agar). %esclava de sara

%%% REGLAS

ascendiente_directo(X, Y) :- (padre(X, Y); madre(X, Y)).

ascendiente(X, Z) :- ascendiente_directo(X, Z).
ascendiente(X, Z) :- ascendiente_directo(X, Y), ascendiente(Y, Z).

hijo(X,Y) :- hombre(X), ascendiente_directo(Y,X).
hija(X,Y) :- mujer(X), ascendiente_directo(Y,X).




abuelo(X,Y) :- hombre(X) , ascendiente_directo(X,Z) , ascendiente_directo(Z,Y).
abuela(X,Y) :- mujer(X) , ascendiente_directo(X,Z) , ascendiente_directo(Z,Y).

hermano(X,Y) :- hombre(X), ascendiente_directo(Z,X), ascendiente_directo(Z,Y), dif(X,Y).  
hermana(X,Y) :- mujer(X), ascendiente_directo(X,Z), ascendiente_directo(Y,Z), dif(X,Y).  

tio(X,Y) :- hombre(X), hermano(X,Z), ascendiente_directo(Z,Y).
tia(X,Y) :- mujer(X), hermano(X,Z), ascendiente_directo(Z,Y).

sobrino(X,Y) :- tio(Y,X) ; tia(Y,X) , hombre(X).
sobrina(X,Y) :- tio(Y,X) ; tia(Y,X) , mujer(X).

primo(X,Y) :- (tio(Z,X);tia(Z,X)),ascendiente_directo(Z,Y) , hombre(X).
prima(X,Y) :- (tio(Z,X);tia(Z,X)),ascendiente_directo(Z,Y) , mujer(X).

parentesco_familiar(X,Y) :- (ascendiente(X,Y);hermano(X,Y);hermana(X,Y);
tio(X,Y);tia(X,Y);sobrino(X,Y);sobrina(X,Y);primo(X,Y);prima(X,Y)).

incestuosos(X,Y) :- parentesco_familiar(X,Y) , ascendiente_directo(X,Z),
ascendiente_directo(Y,Z).

%Ejercicio 2




