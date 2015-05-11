/* --------------------------Seccion codigo-usuario ------------------------ */
//import java_cup.runtime.Symbol;
import java_cup.runtime.*;

%%
/* ----------------- Seccion de opciones y declaraciones  ----------------- */

%cup

%%
/* ------------------------ Seccion de reglas lexicas ---------------------- */


"{" { return new Symbol(sym.CORCHETE_ABIERTO); }
"}" { return new Symbol(sym.CORCHETE_CERRADO); }
"," { return new Symbol(sym.COMA); }
";" { return new Symbol(sym.PUNTO_Y_COMA); }
":=" { return new Symbol(sym.ASIGNADOR); }
"=" { return new Symbol(sym.IGUAL); }
"|" { return new Symbol(sym.UNION); }
"$" { return new Symbol(sym.PALABRA_VACIA); }

"grammar" { return new Symbol(sym.GRAMATICA); }
"terminal" { return new Symbol(sym.TERMINAL); }
"nonterminal" { return new Symbol(sym.NO_TERMINAL); }
"axiom" { return new Symbol(sym.AXIOMA); }
"productions" { return new Symbol(sym.PRODUCCION); }

"automaton" { return new Symbol(sym.AUTOMATA); }
"states" { return new Symbol(sym.ESTADOS); }
"alphabet" { return new Symbol(sym.ALFABETO); }
"initial" { return new Symbol(sym.INICIAL); }
"final" { return new Symbol(sym.FINAL); }
"transition" { return new Symbol(sym.TRANSICION); }


[a-zA-Z]([0-9]|[a-zA-Z])* { return new Symbol(sym.TEXTO, new String(yytext())); }

[ \t\r\n\f] { /* ignora delimitadores */ }
. { System.err.println("Caracter Ilegal: "+yytext()); }
