# Curso Unix para Floqq

Soluciones a los ejercicios

## Texto

### Ejercicio 1

    $ wc *.md

### Ejercicio 2

$ cut -d'<' -f1 página.html

### Ejercicio 3

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

