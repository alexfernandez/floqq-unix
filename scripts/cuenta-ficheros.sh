#!/bin/bash
# Alex 2014-05-11: cuenta todos los ficheros del directorio $HOME

total=0
directorios=0

function cuenta {

	directorios=$(( $directorios +1 ))
	echo "In $1"
	for fichero in $1/*
	do
		if [ -d $fichero ]
		then
			cuenta "$fichero"
		else
			total=$(( $total + 1 ))
		fi
	done 
}

cuenta $1
echo "Total directorios: $directorios, ficheros: $total"

