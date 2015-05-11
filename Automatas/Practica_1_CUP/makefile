all: jflex

jflex:
	jflex exprArit.lex
	cup exprArit.cup
	javac Yylex.java sym.java parser.java
	cat prueba.txt | java parser
	
test:
	jflex exprArit.lex
	cup exprArit.cup
	javac Yylex.java sym.java parser.java
	java parser
