FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1

RUN apk --update --upgrade --no-cache add \
    cairo-dev pango-dev gdk-pixbuf

ADD app.py /app/app.py
WORKDIR /app

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
        musl-dev gcc jpeg-dev zlib-dev libffi-dev \
    && pip install --no-cache-dir weasyprint gunicorn flask \
    && apk del .build-deps

ENV NUM_WORKERS=3
ENV TIMEOUT=120

CMD gunicorn --bind 0.0.0.0:5001 --timeout $TIMEOUT --workers $NUM_WORKERS  app:app
