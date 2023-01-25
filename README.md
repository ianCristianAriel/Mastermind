## Mastermind 🧠:

Crear un programa en Pascal que implemente el juego de lógica MasterMind para el rol de Adivinador, tal como será descrito en este documento. El estudiante deberá poder implementar el programa en cuestión haciendo uso de todas las herramientas vistas hasta ahora en el curso, pudiendo consultar a los docentes a través de la plataforma (Udemy o VirtuaEdu).
Este proyecto tiene como objetivo afianzar todos los conceptos que el estudiante ya aprendió en las clases, enfatizando el uso de arreglos, condiciones y repetición para crear un programa con amplias posibilidades.

### 📃 El programa:
El sistema generará un código al azar con letras que pueden estar repetidas (dependerá del azar), el cual presentará al usuario como primera opción. A partir de allí esperará las notas (buenos y regulares) para mostrar códigos que puedan ser válidos para dichas notas intentando adivinar el código correcto.

### 📃 Espesificacion:
El funcionamiento del programa será el siguiente. Al abrirse mostrará la siguiente salida en la consola:

    MasterMind V3.0
    Dispones de 10 para adivinar el codigo.
    Nota 1 de 10 --> ABBC >>

Como puedes notar, ya se muestra un posible código. Inicialmente, como ya se explicó, este código será aleatorio porque no hay forma de pensar un código adecuado si aún no hay notas posibles. En la salida del prompt el programa mostrará el número de intento actual, el código y quedará a la espera de las notas.
El usuario debe ingresar las notas como números enteros separados por espacio, indicando primero los buenos y luego los regulares. Imaginemos que nuestro código es AABB. Pues para el código que ha presentado nuestro programa resulta que tiene 2 buenos (primera A y tercera B) y 0 regulares. Así que escribimos eso (2 0) y presionamos ENTER:

    Nota 1 de 10 --> ABBC >> 2 0
    Nota 2 de 10 --> ABDA >>

Tomando esas notas, el programa genera un nuevo código, ahora sí “pensando” de manera inteligente, y nos lo presenta. Se actualiza además el número de intento. Dado que nuestro código es AABB resulta que el programa ahora tiene 1 bueno (primera A) y 1 regular (segunda B). Escribimos eso:

    Nota 1 de 10 --> ABBC >> 2 0
    Nota 2 de 10 --> ABDA >> 1 1
    Nota 3 de 10 --> ACAC >>

Ahora las notas para este nuevo código son: 1 bueno y 0 regulares. Continuaremos toda la ejecución del programa hasta el final:

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

Cuando el programa acaba todos los intentos muestra el mensaje `He perdido… :(` y finaliza. Cuando el programa adivine (nosotros le asignaremos las notas adecuadas) mostrará el mensaje:
`EXCELENTE!!! Gane`. Si hacemos trampa (cosa que sería posible), nuestro programa mostrará el mensaje `HAS HECHO TRAMPA!!!`

### 📚 Bibliografia / fuente: 
- http://www.kaedusoft.edu.uy/
- https://www.udemy.com/course/programacion-profesional-desde-cero/

