
# Crear nuevo diccionario solo con palabras de Hunspell (sin flags)
if [ -f /usr/share/hunspell/es_ES.dic ]; then
    # Extraer solo las palabras (todo antes de /)
    cat /usr/share/hunspell/es_ES.dic | \
        grep -v '^#' | \
        sed 's/\/.*$//' | \
        grep -v '^$' > /tmp/hunspell-words.txt
fi

# Extraer palabras de Aspell
if command -v aspell &> /dev/null; then
    aspell -d es dump master | \
        aspell -l es expand | \
        tr ' ' '\n' | \
        grep -v '^$' > /tmp/aspell-words.txt
fi

# Combinar, ordenar y eliminar duplicados
cat /tmp/hunspell-words.txt /tmp/aspell-words.txt | \
    sort -u | \
    grep -v '^[0-9]' | \
    grep -v '^[^a-zA-ZáéíóúüñÁÉÍÓÚÜÑ]' > ~/.config/nvim/spell/es.utf-8.add

# Limpiar temporales
rm /tmp/hunspell-words.txt /tmp/aspell-words.txt

# Compilar
nvim --headless -c 'mkspell! es.utf-8.add' -c 'q'

echo "¡Diccionario limpio creado!"
