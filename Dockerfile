FROM python:3.11

#доступный порт
EXPOSE 8080

WORKDIR app

#сначала копируем только файл с требованиями
#этот файл меняется не часто, Docker обнаружит его и будет использовать кэш для этого шага,
#включив кэш, и для следующего шага.
COPY requirements.txt requirements.txt

#установка зависимости пакета
RUN pip3 install -r requirements.txt

#копируем каталог ./app в каталог /code
COPY . /app

#команда для запуска uvicorn
CMD ["uvicorn", "app.main:app","--host", "127.0.0.1", "--port", "8080"]
