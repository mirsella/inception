#!/bin/bash

if [ ! -f ./wp-config.php ]; then
	echo first launch, installing wordpress
	wp config create --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root
	wp core install --url=localhost --title=Inception --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=${MYSQL_USER}@127.0.0.1 --allow-root
	
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
	wp config set WP_CACHE true --raw --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root

	chown -R www-data:www-data /var/www/html
	chmod -R 755 /var/www/html
fi

php-fpm7.3 -F
