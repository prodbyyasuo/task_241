#!/bin/bash

cd "$HOME" || { echo "Ошибка: не удалось перейти в $HOME"; exit 1; }

FOLDER_NAME="$HOME/system_info_folder"

if [ -d "$FOLDER_NAME" ]; then
    echo "Папка '$FOLDER_NAME' уже существует. Удаляем..."
    rm -rf "$FOLDER_NAME"
fi

mkdir -p "$FOLDER_NAME"
echo "Папка создана: $FOLDER_NAME"

for i in {1..4}; do
    FILE_PATH="$FOLDER_NAME/file$i.txt"

    if [ -f "$FILE_PATH" ]; then
        echo "Файл '$FILE_PATH' существует. Перезаписываем..."
    else
        echo "Создаем файл '$FILE_PATH'"
        touch "$FILE_PATH"
    fi

    {
        echo "=== Файл №$i ==="
        echo "Дата: $(date)"
        echo "Версия ядра: $(uname -r)"
        echo "Имя компьютера: $(hostname)"
        echo "Файлы в домашнем каталоге:"
        ls -la "$HOME"
    } > "$FILE_PATH"
    
    echo "Информация записана в $FILE_PATH"
done

echo "Скрипт завершен."
