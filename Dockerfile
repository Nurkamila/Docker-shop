FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt install -y python3-pip
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

CMD gunicorn --bind 0.0.0.0.8000 config.wsgi:application