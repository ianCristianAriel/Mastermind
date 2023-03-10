## Mastermind 馃:

Crear un programa en Pascal que implemente el juego de l贸gica MasterMind para el rol de Adivinador, tal como ser谩 descrito en este documento. El estudiante deber谩 poder implementar el programa en cuesti贸n haciendo uso de todas las herramientas vistas hasta ahora en el curso, pudiendo consultar a los docentes a trav茅s de la plataforma (Udemy o VirtuaEdu).
Este proyecto tiene como objetivo afianzar todos los conceptos que el estudiante ya aprendi贸 en las clases, enfatizando el uso de arreglos, condiciones y repetici贸n para crear un programa con amplias posibilidades.

### 馃搩 El programa:
El sistema generar谩 un c贸digo al azar con letras que pueden estar repetidas (depender谩 del azar), el cual presentar谩 al usuario como primera opci贸n. A partir de all铆 esperar谩 las notas (buenos y regulares) para mostrar c贸digos que puedan ser v谩lidos para dichas notas intentando adivinar el c贸digo correcto.

### 馃搩 Espesificacion:
El funcionamiento del programa ser谩 el siguiente. Al abrirse mostrar谩 la siguiente salida en la consola:

    MasterMind V3.0
    Dispones de 10 para adivinar el codigo.
    Nota 1 de 10 --> ABBC >>

Como puedes notar, ya se muestra un posible c贸digo. Inicialmente, como ya se explic贸, este c贸digo ser谩 aleatorio porque no hay forma de pensar un c贸digo adecuado si a煤n no hay notas posibles. En la salida del prompt el programa mostrar谩 el n煤mero de intento actual, el c贸digo y quedar谩 a la espera de las notas.
El usuario debe ingresar las notas como n煤meros enteros separados por espacio, indicando primero los buenos y luego los regulares. Imaginemos que nuestro c贸digo es AABB. Pues para el c贸digo que ha presentado nuestro programa resulta que tiene 2 buenos (primera A y tercera B) y 0 regulares. As铆 que escribimos eso (2 0) y presionamos ENTER:

    Nota 1 de 10 --> ABBC >> 2 0
    Nota 2 de 10 --> ABDA >>

Tomando esas notas, el programa genera un nuevo c贸digo, ahora s铆 鈥減ensando鈥? de manera inteligente, y nos lo presenta. Se actualiza adem谩s el n煤mero de intento. Dado que nuestro c贸digo es AABB resulta que el programa ahora tiene 1 bueno (primera A) y 1 regular (segunda B). Escribimos eso:

    Nota 1 de 10 --> ABBC >> 2 0
    Nota 2 de 10 --> ABDA >> 1 1
    Nota 3 de 10 --> ACAC >>

Ahora las notas para este nuevo c贸digo son: 1 bueno y 0 regulares. Continuaremos toda la ejecuci贸n del programa hasta el final:

    Nota 1 de 10 --> ABBC >> 2 0
    Nota 2 de 10 --> ABDA >> 1 1
    Nota 3 de 10 --> ACAC >> 1 0
    Nota 4 de 10 --> ADBB >> 3 0
    Nota 5 de 10 --> ADBC >> 2 0
    Nota 6 de 10 --> ADDA >> 1 1
    Nota 7 de 10 --> AEAB >> 2 1
    Nota 8 de 10 --> AEBC >> 2 0
    Nota 9 de 10 --> AEDA >> 1 1
    Nota 10 de 10 --> AFAB >> 2 1
    He perdido... :(

Cuando el programa acaba todos los intentos muestra el mensaje `He perdido鈥? :(` y finaliza. Cuando el programa adivine (nosotros le asignaremos las notas adecuadas) mostrar谩 el mensaje:
`EXCELENTE!!! Gane`. Si hacemos trampa (cosa que ser铆a posible), nuestro programa mostrar谩 el mensaje `HAS HECHO TRAMPA!!!`

### 馃摎 Bibliografia / fuente: 
- http://www.kaedusoft.edu.uy/
- https://www.udemy.com/course/programacion-profesional-desde-cero/

