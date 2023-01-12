FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y python3-pip
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

ENV DB_NAME=
ENV DB_USER=
ENV DB_PASSWORD=
ENV DB_HOST=
ENV DB_PORT=
ENV SECRET_KEY=django-insecure-svw2og$!fs5ihel_18s80^dud$0u2af%fzc%p(&!t2z)4qepn_

CMD gunicorn --bind 0.0.0.0.8000 config.wsgi:application