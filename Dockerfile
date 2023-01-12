FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y python3-pip
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

ENV DB_NAME=railway
ENV DB_USER=postgres
ENV DB_PASSWORD=ubZV16SyJ8rXVjw6W968
ENV DB_HOST=containers-us-west-122.railway.app
ENV DB_PORT=7900
ENV SECRET_KEY=django-insecure-svw2og$!fs5ihel_18s80^dud$0u2af%fzc%p(&!t2z)4qepn_
ENV PORT=8000

CMD gunicorn --bind 0.0.0.0.$PORT config.wsgi:application