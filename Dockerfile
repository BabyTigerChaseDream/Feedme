FROM python:3.7-alpine

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
# fix mysqlclient issue
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev
RUN pip install mysqlclient
RUN apk del build-deps

########################
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir /djangoFeedme
COPY ./djangoFeedme /djangoFeedme
WORKDIR /djangoFeedme
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser -D user

RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web

USER user

CMD ["entrypoint.sh"]
