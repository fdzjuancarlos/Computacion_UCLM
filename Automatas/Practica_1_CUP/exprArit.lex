/* --------------------------Seccion codigo-usuario ------------------------ */
//import java_cup.runtime.Symbol;
import java_cup.runtime.*;

%%
/* ----------------- Seccion de opciones y declaraciones  ----------------- */

%cup

%%
/* ------------------------ Seccion de reglas lexicas ---------------------- */

"/*" (.)* "*/" { }

"{" { return new Symbol(sym.CORCHETE_ABIERTO); }
"}" { return new Symbol(sym.CORCHETE_CERRADO); }
"(" { return new Symbol(sym.PARENTESIS_ABIERTO); }
")" { return new Symbol(sym.PARENTESIS_CERRADO); }
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

"FAtoRE" { return new Symbol(sym.FUN_FA_TO_RE); }
"CFGtoPDA" { return new Symbol(sym.FUN_CFG_TO_PDA); }
"clean" { return new Symbol(sym.FUN_CLEAN); }

"regexp" { return new Symbol(sym.EXPRESION_REGULAR); }
"'" { return new Symbol(sym.COMILLA); }
"@" { return new Symbol(sym.LENGUAJE_VACIO); }
"[" { return new Symbol(sym.P_CUADRADO_ABIERTO); }
"]" { return new Symbol(sym.P_CUADRADO_CERRADO); }
"-" { return new Symbol(sym.GUION); }
"*" { return new Symbol(sym.CLAUSURA); }
"+" { return new Symbol(sym.CLAUSURA_POSITIVA); }
"?" { return new Symbol(sym.INTERROGACION); }

"recognize" { return new Symbol(sym.RECONOCER); }
"REtoFA" { return new Symbol(sym.RETOFA); }
"FAtoNDFA" { return new Symbol(sym.FATONDFA); }

[a-zA-Z] { return new Symbol(sym.CARACTER, new String(yytext())); }
[a-zA-Z]([0-9a-zA-Z])* { return new Symbol(sym.IDENTIFICADOR, new String(yytext())); }

[0-9a-zA-Z] { return new Symbol(sym.CARACTER_NUMERO, new String(yytext())); }
[0-9a-zA-Z]([0-9a-zA-Z])* { return new Symbol(sym.CARACTERES_NUMEROS, new String(yytext())); }

[ \t\r\n\f] { /* ignora delimitadores */ }
. { System.err.println("Caracter Ilegal: "+yytext()); }
