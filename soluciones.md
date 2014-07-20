# Curso Unix para Floqq

Soluciones a los ejercicios del curso Floqq sobre La Consola Unix.

## ¡Hola, mundo!

Algunos comentarios sobre los ejercicios.

### Ejercicio 1: eco eco

El comando `echo` no funciona con los siguientes caracteres:

    $ echo hola; mundo
    $ echo hola & mundo
    $ echo hola | mundo
    $ echo hola ( mundo
    $ echo hola ) mundo
    $ echo hola < mundo

Y tiene efectos curiosos con estos otros:

    $ echo hola # mundo
    $ echo hola * mundo
    $ echo hola > mundo

### Ejercicio 2: instala Homebrew

Si hay problemas revisa el [FAQ](https://github.com/Homebrew/homebrew/wiki/FAQ)
(preguntas frecuentes).

### Ejercicio 3: instala Cygwin

Igualmente, si hay problemas revisa el [FAQ](https://cygwin.com/faq.html).

## Introducción a Unix

### Ejercicio 1: instala git

Cada Unix tiene su mecanismo de instalación de paquetes.
El mecanismo universal es la instalación del código fuente,
que veremos más adelante.

### Ejercicio 2: baja el proyecto

Los ficheros que hemos bajado se usarán en el resto del curso.

### Ejercicio 3: baja el zip

Se puede bajar el fichero desde la URL [http://alexfernandez.github.io/floqq-unix.zip](http://alexfernandez.github.io/floqq-unix.zip),
y descomprimirlo con las herramientas gráficas.

## Ficheros

### Ejercicio 1: crea muchos

    $ touch prueba1.txt
    $ touch prueba2.png
    $ touch prueba3.fake

    $ file prueba*
    prueba1.txt:  empty
    prueba2.png:  empty
    prueba3.fake: empty

`file` no se deja engañar por el nombre del fichero.

    $ rm prueba*

### Ejercicio 2: directorio no vacío

    $ mkdir ejemplo
    $ cd ejemplo
    $ touch prueba1.txt
    $ touch prueba2.png

    $ cd ..
    $ rmdir ejemplo
    rmdir: fallo al borrar «ejemplo/»: El directorio no está vacío

No se puede borrar el directorio: hay que borrar primero el contenido.

    $ rm ejemplo/prueba*
    $ rmdir ejemplo

¡Ahora sí!

### Ejercicio 3: de vuelta

Comandos del ejercicio:

    $ ls
    ejemplo.txt  LICENSE  página.html  pic  README.md  soluciones.md
    $ touch novedad
    $ cp ejemplo.txt copia.txt
    $ mv ejemplo.txt pic/movido.txt
    $ mv *.md pic/
    $ mv LICE?SE pic/
    $ rm novedad
    $ rm noexiste
    rm: no se puede borrar «noexiste»: No existe el fichero o el directorio
    $ mkdir nuevodir
    $ rmdir nuevodir
    $ ln -s ejemplo.txt pic/defuera.txt
    $ cd pic
    $ ln -s ../ejemplo.txt dedentro.txt
    $ df -h

Y de vuelta:

    $ cd ..
    $ rm pic/dedentro.txt pic/defuera.txt
    $ mv pic/LICENSE pic/*.md .

(Mueve varios ficheros a la vez.)

    $ mv pic/movido.txt ejemplo.txt

Mueve y renombra.

## Texto

### Ejercicio 1: cuenta palabras

    $ wc *.md
      4   7  48 README.md
     21  40 312 soluciones.md
     25  47 360 total

### Ejercicio 2: búsqueda recursiva

    $ grep ejercicios *
    grep: pic: Es un directorio
    soluciones.md:Soluciones a los ejercicios
    [...]

### Ejercicio 3: hasta <

    $ cut -d'<' -f1 página.html
    Esta página está permanentemente en construcción.
    [...]
    Como puede verse en este gráfico.

## Procesos

### Ejercicio 1: kill top

En el primera terminal:

    $ top

En el segundo terminal:

    $ ps
    [...]
    11871 pts/3    S+     0:00 top
    [...]
    $ kill 11871

### Ejercicio 2: aviso

    $ sleep 60 && echo "aviso" &
    [2] 15498
    [1]   Hecho                   sleep 60
    $

Tras 60 segundos:

    $ hola

### Ejercicio 3: memoria al inicio

    $ free
    ...
    $ free

### Ejercicio 4: asesino en serie

En Linux, matando el proceso X: `/usr/bin/Xorg` mata el servidor gráfico. Matando el Display Manager (en mi máquina, `lightdm`) lleva al login.

En Mac OS X es más difícil matar nada que afecte al sistema.

## Enlazando comandos

### Ejercicio 1: etc

    $ tree /etc | less

### Ejercicio 2: cuenta procesos

    $ ps x | wc
         98     972   25928

... menos uno (la cabecera de `ps`)

### Ejercicio 3: iniciales

    $ wget http://www.cs.duke.edu/~ola/ap/linuxwords
    --2014-05-11 11:36:36--  http://www.cs.duke.edu/~ola/ap/linuxwords
    [...]
    $ cat linuxwords | cut -c1 | sort | uniq -c
       3086 a
        491 A
       2648 b
        552 B
       3899 c
    [...]
       4532 s
    [...]

Gana la letra 's' minúscula.

## Opciones

### Ejercicio 1: último modificado

    $ ls -tr | tail -n 1

### Ejercicio 2: comprime con Bzip2

    $ tar -cjf pic.tar.bz pic/
    $ mv pic.tar.bz pic/
    $ cd pic/
    $ tar -xjf pic.tar.bz

### Ejercicio 3: sin D ni d

    $ cat ejemplo.txt | grep -vi d

### Ejercicio 4: cuenta procesos de usuario

    $ ps aux | cut -d' ' -f1 | sort | uniq -c
          2 avahi
         98 usuario
          1 colord
          1 daemon
          1 message+
          1 nobody
         79 root
          1 rtkit
          1 statd
          1 USER

Descuenta USER que es la cabecera (la primera línea de ps).

## Buscando comandos

### Ejercicio 1: movidas

    $ history | grep mv | wc

### Ejercicio 2: cuenta procesos de usuario

Duplicado del capítulo anterior.

### Ejercicio 2b: bonus round

Busca la cadena "-l" en la ayuda de `ls`.

Pista: puede que haya que "escapar" el guión usando "\-l".

La solución, al final del fichero.

### Ejercicio 3: acceso remoto

    $ apropos remote | grep login
    rlogin (1)           - OpenSSH SSH client (remote login program)
    rsh (1)              - OpenSSH SSH client (remote login program)
    slogin (1)           - OpenSSH SSH client (remote login program)
    ssh (1)              - OpenSSH SSH client (remote login program)
    ssh-copy-id (1)      - use locally available keys to authorise logins on a remote machine

O de una tacada:

    $ apropos "remote login"
    rlogin (1)           - OpenSSH SSH client (remote login program)
    rsh (1)              - OpenSSH SSH client (remote login program)
    slogin (1)           - OpenSSH SSH client (remote login program)
    ssh (1)              - OpenSSH SSH client (remote login program)

## Expresiones regulares
 
### Ejercicio 1: tags HTML

    egrep "<(\w+).*>[^<>]*</\1>" página.html

### Ejercicio 2: números

    echo "4" | egrep -o "[0-9](\.[0-9])?"
    4
    echo "5.3" | egrep -o "[0-9](\.[0-9])?"
    5.3
    echo "89987898.5887999" | egrep -o "[0-9](\.[0-9])?"
    89987898.5887999

### Ejercicio 3: regex golf

Soluciones a los primeros seis hoyos del [torneo de golf](http://regex.alf.nu/):

    foo
    k$
    [abcdef]{4}
    (\w\w\w)\w*\1
    ^(?!.*(.)(.)\2\1)
    ^(.)(.).*\2\1$

Total: 1180 puntos.

## Seguridad

### Ejercicio 1: sé root

    $ sudo su
    #

¡Ahora eres root!

### Ejercicio 2: nuevo dueño

    # mkdir /var/log/pepito
    # touch /var/log/pepito/pepito.log
    # chown -R usuario:usuario /var/log/pepito

### Ejercicio 3: nuevo amigo

    # adduser pepito
    # su pepito
    $ exit
    # deluser pepito

## Comandos avanzados

Estos ejercicios no tienen realmente solución, pero añado algunos consejos.

### Ejercicio 1: Copia de seguridad

Los sistemas Unix modernos auto-montan las unidades externas.
Localiza el directorio donde se ha montado el disco con `df -h`:
llamémoslo `<disco>`.
Luego corre este comando:

    $ rsync -av $HOME /media/usb

### Ejercicio 2: Navega en texto

Links2 permite navegar, seguir enlaces, introducir texto y rellenar formularios.

### Ejercicio 3: En las nubes

Amazon AWS permite crear un certificado y bajarlo, con el nombre del certificado
(ejemplo: `<certificado>.pem`). La máquina estará accesible por dirección IP.
Luego sólo hay que hacer:

    $ ssh -i certificado.pem <ip>

Y ya estamos dentro.

## Algunos trucos

Estos ejercicios tampoco tienen solución; de nuevo veremos algunos consejos.

### Ejercicio 1: Entorno de compilación

Es algo complejo montar el entorno de compilación.
Busca cualquier error que te aparezca en internet, y sigue las instrucciones.
Si necesitas ayuda, escríbeme a alejandrofer@gmail.com indicando dónde te has quedado y
qué te falla.

### Ejercicio 2: Instala aalib

No tiene mucha historia.

### Ejercicio 3: Compila bb

De nuevo, busca en internet los errores y contáctame si no puedes resolverlos.

## Scripts

### Ejercicio 1: Crea un montón

La solución está en el script en `scripts/crea-un-monton.sh`.

### Ejercicio 2: Lista ficheros

La solución está en el script en `scripts/lista-ficheros.sh`.

### Ejercicio 3: Cuenta ficheros

La solución está en el script en `scripts/cuenta-ficheros.sh`.
Fíjate cómo la función `cuenta` se llama a sí misma.

## Buscando comandos revisited

### Ejercicio 2b: Bonus round

    $ man ls | grep "\-l"

## Contacto

Envía tus dudas a alejandrofer@gmail.com.

