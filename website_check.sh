#!/bin/bash

# Файл логів
LOG_FILE="website_status.log"

# Масив вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Очищення попереднього файлу логів
> "$LOG_FILE"

# Перевірка доступності кожного сайту
for site in "${websites[@]}"
do
    status=$(curl -o /dev/null -s -w "%{http_code}" -L "$site")
    if [ "$status" -eq 200 ]; then
        echo "$site is UP" | tee -a "$LOG_FILE"
    else
        echo "$site is DOWN" | tee -a "$LOG_FILE"
    fi
done

echo "Результати перевірки записані у файл $LOG_FILE"

