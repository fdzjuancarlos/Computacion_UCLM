
Para ejecutar el demostrador de teoremas:

Cree un archivo .txt y escriba dentro de el las fórmulas con el siguiente formato:

-Cada formula debe acabar en “.”
-La conjunción se escribe como “&&”
-La disyunción se escribe como “v”
-La negación se escribe como “¬”
-La implicación como “>”
-Todos los símbolos deben ir separados, tanto los átomos como los operadores lógicos.

Ejemplo de fichero:

p v q.
¬ p.
p v ¬ q.

Para ejecutarlo, ejecute “swipl demostrador.pl” y dentro del intérprete
prolog ejecute input(‘<nombre fichero’). 

El fichero debe estar en el mismo directorio, utilice comillas simples para entrecomillar
el nombre del fichero.

Se le indicará si se ha encontrado o no una contradicción y la aplicación devolverá
true o false en consonancia a si se encontró la contradicción con las fórmulas propuestas.