# Curso Unix para Floqq

Soluciones a los ejercicios

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

### Ejercicio 2: memoria al inicio

    $ free
    ...
    $ free

### Ejercicio 3:

## Enlazando comandos

### Ejercicio 1: etc

    $ tree /etc | less

### Ejercicio 2: cuenta procesos

    $ ps aux | cut -d' ' -f1 | sort | uniq -c
          2 avahi
         98 chenno
          1 colord
         13 couchba+
          1 daemon
          1 message+
          1 mongodb
          1 nobody
          4 rabbitmq
         79 root
          1 rtkit
          1 statd
          1 USER

### Ejercicio 3:

## Expresiones regulares

### Ejercicio 1

cat page.html | egrep -o "<(\w+).*>[^<>]*</\1>"

### Ejercicio 3

Soluciones a los primeros seis hoyos del torneo de golf:

    foo
    k$
    [abcdef]{4}
    (\w\w\w)\w*\1
    ^(?!.*(.)(.)\2\1)
    ^(.)(.).*\2\1$

