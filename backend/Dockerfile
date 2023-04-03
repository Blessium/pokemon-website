FROM python:alpine3.17

COPY . .

RUN pip3 install flask

RUN apk add --no-cache mariadb && apk add --no-cache mariadb-connector-c-dev && apk add --no-cache build-base
RUN pip3 install mariadb


CMD [ "flask", "run", "--host=0.0.0.0"]