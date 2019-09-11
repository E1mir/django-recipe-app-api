FROM python:3.7-alpine
MAINTAINER E1mir

# run python in unbuffered mode
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir -p /app
WORKDIR /app
COPY ./app /app

# Avoid root access to the whole image
RUN adduser -D user
USER user
