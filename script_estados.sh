#!/bin/bash

# ============================================================
# Conteo de estados encontrados en una auditoría Lynis
#
# Uso:
#   ./script_estados.sh auditoria1.txt
# ============================================================

if [ $# -ne 1 ]; then
    echo "ERROR: Debe proporcionar el archivo generado por Lynis."
    echo
    echo "Uso:"
    echo "  $0 <archivo>"
    echo
    echo "Ejemplo:"
    echo "  $0 auditoria1.txt"
    exit 1
fi

ARCHIVO="$1"

# Verificar que el archivo existe
if [ ! -f "$ARCHIVO" ]; then
    echo "ERROR: No se encontró el archivo: $ARCHIVO"
    exit 1
fi

# Verificar que el archivo no está vacío
if [ ! -s "$ARCHIVO" ]; then
    echo "ERROR: El archivo está vacío: $ARCHIVO"
    exit 1
fi

ESTADOS='OK|DONE|HECHO|ENCONTRADO|NO ENCONTRADO|NINGUNO|HABILITADO|DESHABILITADO|NO HABILITADO|SIN ACTIVAR|SUGERENCIA|INSEGURO|MEDIO|PROTEGIDO|DÉBIL|PELIGRO|POR DEFECTO|BASTIONADO|PARCIALMENTE BASTIONADO|DIFERENTE|OMITIDO|DESCONOCIDO|INSTALADO|NO ESTÁ CORRIENDO|NO DESHABILITADO|ARCHIVOS ENCONTRADOS|SIN ACTUALIZACIÓN|ACTIVO'

echo "==============================================="
echo " FRECUENCIA DE ESTADOS - AUDITORÍA LYNIS"
echo "==============================================="
echo "Archivo analizado: $ARCHIVO"
echo "-----------------------------------------------"
printf "%-30s %10s\n" "ESTADO" "CANTIDAD"
echo "-----------------------------------------------"

# Procesamiento
sed 's/\x1B\[[0-9;]*[mK]//g' "$ARCHIVO" \
    | tr -d '\r' \
    | grep -oE '\[[[:space:]]*[^][]+[[:space:]]*\]' \
    | sed 's/^\[[[:space:]]*//; s/[[:space:]]*\]$//' \
    | grep -E "^($ESTADOS)$" \
    | sort \
    | uniq -c \
    | sort -nr \
    | awk '{
        cantidad=$1;
        $1="";
        sub(/^ /,"");
        printf "%-30s %10d\n", $0, cantidad
    }'
