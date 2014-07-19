#!/bin/bash
# Alex 2014-07-19: crea 10 ficheros y luego los borra

for counter in {1..20}
do
	filename="hola$counter.txt"
	echo "Creando $filename"
	touch $filename
done 

for counter in {1..20}
do
	filename="hola$counter.txt"
	echo "Borrando $filename"
	rm -f $filename
done 


