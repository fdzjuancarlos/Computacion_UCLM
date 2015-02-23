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

casado(X,Y) :- casado(Y,X).

abuelo(X,Y) :- hombre(X) , ascendiente_directo(X,Z) , ascendiente_directo(Z,Y).