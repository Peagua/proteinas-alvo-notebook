#!/bin/bash

echo "Indexador de proteomas automático"
echo ""

# Diretório contendo os proteomas
INPUT_DIR="proteoma"
OUTPUT_DIR="index"

for filepath in "$INPUT_DIR"/*; do
    [ -f "$filepath" ] || continue

    filename=$(basename "$filepath")
    basename_file="${filename%.*}"

    echo "Indexando: $filepath"

    makeblastdb -in $filepath -dbtype prot \
    -out "$OUTPUT_DIR/$basename_file/$basename_file" -title "$basename_file proteome"

    echo "Indexação de $filepath completa"
    echo ""

done

echo "Todos os proteomas foram indexados!"
