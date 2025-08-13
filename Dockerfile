# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt .

# Устанавливаем зависимости
RUN useradd -m app && mkdir -p /app/uploads /app/reports && chown -R app:app /app
USER app

# Копируем все файлы проекта в рабочую директорию
COPY . .

# Команда, которая будет выполняться при запуске контейнера
ENTRYPOINT ["python", "main.py"]