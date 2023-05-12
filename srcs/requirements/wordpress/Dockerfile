FROM debian:buster

ARG WORDPRESS_VERSION=6.2

ARG MYSQL_USER
ARG MYSQL_PASSWORD

ENV MYSQL_PASSWORD ${MYSQL_PASSWORD}
ENV MYSQL_USER ${MYSQL_USER}

RUN apt-get update && \
    apt-get install -y wget mariadb-client php7.3-fpm php7.3-redis redis php7.3-mysql php7.3-mbstring php7.3-gd php7.3-curl php7.3-zip && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O wp && \
	chmod +x wp && \
	mv wp /usr/local/bin/

RUN wget https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz && \
    tar -xzf wordpress-${WORDPRESS_VERSION}.tar.gz && \
    rm -f wordpress-${WORDPRESS_VERSION}.tar.gz && \
	mkdir /var/www && \
    mv wordpress /var/www/html

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

COPY ./launch_php-fpm.sh .

RUN chown -R www-data:www-data /var/www/html && \
chmod -R 755 /var/www/html && \
mkdir /run/php

EXPOSE 9000

CMD [ "bash", "./launch_php-fpm.sh" ]

