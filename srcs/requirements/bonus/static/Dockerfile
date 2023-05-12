FROM alpine:3.17.3

RUN apk add --update --no-cache hugo

WORKDIR /var/www/html

RUN hugo new site .

COPY src content

EXPOSE 8080

ENTRYPOINT ["hugo", "server", "--bind", "0.0.0.0", "--port", "8080", "--baseURL=https://mirsella.42.fr/static"]
