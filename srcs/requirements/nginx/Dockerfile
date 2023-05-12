FROM	debian:buster

RUN		apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/mirsella.crt \
       -keyout /etc/nginx/ssl/mirsella.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=mirsella/CN=mirsella/"

COPY ./nginx.conf /etc/nginx/conf.d

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
