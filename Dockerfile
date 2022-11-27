FROM python:3.9.6-alpine

WORKDIR usr/src/crud_dc

#Запрещает Python записывать файлы pyc на диск
ENV PYTHONDONTWRITEBYTECODE 1
#Запрещает Python буферизовать stdout и stderr
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/crud_dc/entrypoint.sh
RUN chmod +x /usr/src/crud_dc/entrypoint.sh

# create directory for the app user
RUN mkdir -p /home/crud_dc

# create the app user
RUN addgroup -S crud_dc && adduser -S crud_dc -G crud_dc

ENV HOME=/home/crud_dc
ENV CRUD_HOME=/home/crud_dc/backend
RUN mkdir $CRUD_HOME
RUN mkdir $CRUD_HOME/static
WORKDIR $CRUD_HOME

COPY . .

ENTRYPOINT ["/usr/src/crud_dc/entrypoint.sh"]

#RUN python manage.py migrate
#RUN python manage.py loaddata logistic_db.json

