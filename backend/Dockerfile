FROM python:alpine3.17

COPY . .

RUN pip3 install flask

RUN pip install mysql-connector-python


CMD [ "flask", "run", "--host=0.0.0.0"]