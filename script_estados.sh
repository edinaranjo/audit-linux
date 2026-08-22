#!/bin/bash

# Aqui se debe poner el nombre del archivo a analizar. Este es un ejemplo

ARCHIVO="lynis.txt"

ESTADOS='OK|DONE|HECHO|ENCONTRADO|NO ENCONTRADO|NINGUNO|HABILITADO|DESHABILITADO|NO HABILITADO|SIN ACTIVAR|SUGERENCIA|INSEGURO|MEDIO|PROTEGIDO|DÉBIL|PELIGRO|POR DEFECTO|BASTIONADO|PARCIALMENTE BASTIONADO|DIFERENTE|OMITIDO|DESCONOCIDO|INSTALADO|NO ESTÁ CORRIENDO|NO DESHABILITADO|ARCHIVOS ENCONTRADOS|SIN ACTUALIZACIÓN'

echo "==============================================="
echo " FRECUENCIA DE ESTADOS - AUDITORÍA LYNIS"
echo "==============================================="
printf "%-30s %10s\n" "ESTADO" "CANTIDAD"
echo "-----------------------------------------------"

grep -oE '\[[[:space:]]*[^][]+[[:space:]]*\]' "$ARCHIVO" \
    | sed 's/^\[[[:space:]]*//; s/[[:space:]]*\]$//' \
    | grep -E "^($ESTADOS)$" \
    | sort \
    | uniq -c \
    | sort -nr \
    | awk '{cantidad=$1; $1=""; sub(/^ /,""); printf "%-30s %10d\n",$0,cantidad}'
