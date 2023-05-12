FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN service mysql start && mysqladmin -u root password ${MYSQL_ROOT_PASSWORD}

RUN service mysql start && mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE wordpress; CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; GRANT ALL ON wordpress.* TO '${MYSQL_USER}'@'%'; FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]
