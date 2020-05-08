#FROM python:3.8-buster
FROM python:3.8-alpine3.11

RUN apk add --update --no-cache --virtual .build-deps \
        g++ \
        python-dev \
        libxml2 \
        libxml2-dev && \
    apk add libxslt-dev && \
    pip install lxml && \
    apk del .build-deps

RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev && \
    apk add --no-cache libxslt && \
    pip install --no-cache-dir lxml>=3.5.0 && \
    apk del .build-deps

RUN pip install opcua-webclient
CMD ["/usr/local/bin/opcua-webclient","80"]
EXPOSE 80
