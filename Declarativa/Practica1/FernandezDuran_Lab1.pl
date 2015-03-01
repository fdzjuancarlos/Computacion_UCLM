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

descendiente_directo(X, Y) :- ascendiente_directo(Y, X).
descendiente(X, Z) :- ascendiente(Z, X).

hijo(X,Y) :- hombre(X), ascendiente_directo(Y,X).
hija(X,Y) :- mujer(X), ascendiente_directo(Y,X).


%a)Definir las relaciones:

abuelo(X,Y) :- hombre(X) , ascendiente_directo(X,Z) , ascendiente_directo(Z,Y).
abuela(X,Y) :- mujer(X) , ascendiente_directo(X,Z) , ascendiente_directo(Z,Y).

hermano(X,Y) :- hombre(X), ascendiente_directo(Z,X), ascendiente_directo(Z,Y), dif(X,Y).  
hermana(X,Y) :- mujer(X), ascendiente_directo(X,Z), ascendiente_directo(Y,Z), dif(X,Y).  

tio(X,Y) :- (ascendiente_directo(Z, Y), (hermano(X, Z); (casado(X, T), hermana(T, Z))).
tia(X,Y) :- (ascendiente_directo(Z, Y), (hermana(X, Z); (casado(X, T), hermano(T, Z))).

sobrino(X,Y) :- tio(Y,X) ; tia(Y,X) , hombre(X).
sobrina(X,Y) :- tio(Y,X) ; tia(Y,X) , mujer(X).

primo(X,Y) :- (tio(Z,X);tia(Z,X)),ascendiente_directo(Z,Y) , hombre(X).
prima(X,Y) :- (tio(Z,X);tia(Z,X)),ascendiente_directo(Z,Y) , mujer(X).

%b)

familia(X, Y) :- (ascendiente_directo(X, Y); descendiente_directo(X, Y); abuelo(X,Y); abuelo(Y,X); abuela(X,Y); abuela(Y,X); hermano(X, Y); hermana(X, Y)).

incestuosos(X, Y) :- casado(X, Y), familia(X, Y).

%c) ascendiente es recursiva, todas las demas relaciones son indirectamente recursivas.

%d) Todos los predicados conservan la propiedad de ser inversibles



%Ejercicio 2

familia(persona(antonio, foix, fecha(7, febrero, 1950), trabajo(renfe, 1200)),
persona(maria, lopez, fecha(17, enero, 1952), trabajo(sus_labores, 0)),
[persona(patricia, foix, fecha(10, junio, 1970), trabajo(estudiante, 0)),
persona(juan, foix, fecha(30, mayo, 1972), trabajo(estudiante,0))] ).

familia( persona(manuel, monterde, fecha(15, marzo, 1934), trabajo(profesor, 2000)),
persona(pilar, gonzalez, fecha(9, julio, 1940), trabajo(maestra, 1900)),
[ persona(manolo, monterde, fecha(10, febrero, 1964), trabajo(arquitecto, 5000)),
persona(javier, monterde, fecha(24, noviembre, 1968), trabajo(estudiante, 0)) ] ).
familia( persona(jose, benitez, fecha(3, septiembre, 1958), trabajo(profesor, 2000)),
persona(aurora, carvajal, fecha(29, agosto, 1972), trabajo(maestra, 1900)),
[ persona(jorge, benitez, fecha(6, noviembre, 1997), trabajo(desocupado, 0))] ).
familia( persona(jacinto, gil, fecha(7, junio, 1958), trabajo(minero, 1850)),
persona(guillermina, diaz, fecha(12, enero, 1957), trabajo(sus_labores, 0)),
[ persona(carla, gil, fecha(1, agosto, 1958), trabajo(oficinista, 1500)),
persona(amalia, gil, fecha(6, abril, 1962), trabajo(deliniante, 1900)), 
persona(irene, gil, fecha(3, mayo, 1970), trabajo(estudiante, 0)) ] ).
familia( persona(ismael, ortega, fecha(7, junio, 1966), trabajo(carpintero, 2350)),
persona(salvadora, diaz, fecha(12, enero, 1968), trabajo(sus_labores, 0)),
[] ).
familia( persona(pedro, ramirez, fecha(7, junio, 1966), trabajo(en_paro,0)),
persona(teresa, fuentes, fecha(12, enero, 1968), trabajo(administrativa, 1250)),
[] ).

ej2a(Nombre,Apellidos) :- familia(_,M,H), length(H,X), X>=3, 
M=persona(Nombre,Apellidos,_,_).

ej2b(Apellidos_Padre,Apellidos_Madre) :- familia(P,M,H), length(H,0), 
P=persona(_,Apellidos_Padre,_,_),
M=persona(_,Apellidos_Madre,_,_).

ej2c(Apellidos_Padre,Apellidos_Madre) :- familia(P,M,_), 
P=persona(_,Apellidos_Padre,_,trabajo(T,_)),
(T=en_paro;T=desocupado),
M=persona(_,Apellidos_Madre,_,trabajo(Tmadre,_)),
not(Tmadre=en_paro;Tmadre=desocupado).


%Ejercicio 3


padre(P) :- familia(P,_,_).
madre(P) :- familia(_,P,_).

pertenece(X, [Y|T]) :- X = Y; pertenece(X, T).
hijo(P) :- familia(_,_,H), pertenece(P,H).

existe(P) :- padre(P) ; madre(P) ; hijo(P).

f_nacimiento(P,F) :- existe(P), P=persona(_,_,F,_).

salario(P,S) :- existe(P), P=persona(_,_,_,trabajo(_,S)).

ej3a(Nombre, Apellidos) :- existe(P) , P=persona(Nombre,Apellidos,_,_).
ej3b(Nombre_Hijo, Apellidos_Hijo) :- hijo(P) , 
P=persona(Nombre_Hijo, Apellidos_Hijo,_,_),
f_nacimiento(P,F), F=fecha(_,_,Year), Year > 1980.

ej3c(Nombre_Mujer, Apellidos_Mujer) :- madre(P), 
P=persona(Nombre_Mujer, Apellidos_Mujer, _ , trabajo(Tmadre,_)),
not(Tmadre=en_paro;Tmadre=desocupado).

ej3d(Nombre, Apellidos) :- existe(P),
P=persona(Nombre,Apellidos,fecha(_,_,Year), trabajo(Trabajo,_)),
(Trabajo=en_paro;Trabajo=desocupado),
Year < 1960.

ej3e(Nombre, Apellidos) :- existe(P),
P=persona(Nombre,Apellidos,fecha(_,_,Year), _),
Year > 1950,
salario(P,S), S >= 800 , S =< 1300.
