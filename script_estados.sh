
#!/bin/bash

# ------------------------------------------------------------
# Script para contar los estados encontrados en una salida Lynis
# Uso:
#   ./script_estados.sh auditoria1.txt
# ------------------------------------------------------------

if [ $# -ne 1 ]; then
    echo "ERROR: Debe indicar el archivo de auditoría."
    echo
    echo "Uso:"
    echo "  $0 <archivo>"
    echo
    echo "Ejemplo:"
    echo "  $0 auditoria1.txt"
    exit 1
fi

ARCHIVO="$1"

if [ ! -f "$ARCHIVO" ]; then
    echo "ERROR: No se encontró el archivo: $ARCHIVO"
    exit 1
fi

ESTADOS='OK|DONE|HECHO|ENCONTRADO|NO ENCONTRADO|NINGUNO|HABILITADO|DESHABILITADO|NO HABILITADO|SIN ACTIVAR|SUGERENCIA|INSEGURO|MEDIO|PROTEGIDO|DÉBIL|PELIGRO|POR DEFECTO|BASTIONADO|PARCIALMENTE BASTIONADO|DIFERENTE|OMITIDO|DESCONOCIDO|INSTALADO|NO ESTÁ CORRIENDO|NO DESHABILITADO|ARCHIVOS ENCONTRADOS|SIN ACTUALIZACIÓN|ACTIVO'

echo "==============================================="
echo " FRECUENCIA DE ESTADOS - AUDITORÍA LYNIS"
echo " Archivo: $ARCHIVO"
echo "==============================================="
printf "%-30s %10s\n" "ESTADO" "CANTIDAD"
echo "-----------------------------------------------"

grep -oE '\[[[:space:]]*[^][]+[[:space:]]*\]' "$ARCHIVO" \
    | sed 's/^\[[[:space:]]*//; s/[[:space:]]*\]$//' \
    | grep -E "^($ESTADOS)$" \
    | sort \
    | uniq -c \
    | sort -nr \
    | awk '{
        cantidad=$1;
        $1="";
        sub(/^ /,"");
        printf "%-30s %10d\n",$0,cantidad
    }'
