FROM debian:buster

RUN apt update -y && apt install wget php7.3 php7.3-fpm php7.3-mysql -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html /run/php && cd /var/www/html && rm index.html ; \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O adminer.php && \
	chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html

WORKDIR /var/www/html

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000
# STOPSIGNAL SIGQUIT

CMD ["php-fpm7.3", "--nodaemonize"]
