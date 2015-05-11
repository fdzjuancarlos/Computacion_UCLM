all: jflex

jflex:
	jflex analizador.lex
	cup analizador.cup
	javac Yylex.java sym.java parser.java
	cat prueba.txt | java parser
	
test:
	jflex analizador.lex
	cup analizador.cup
	javac Yylex.java sym.java parser.java
	java parser
