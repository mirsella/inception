FROM alpine:3.17.3

ARG FTP_USER ${FTP_USER}
ARG FTP_PASS ${FTP_PASS}

ENV FTP_USER ${FTP_USER} 
ENV FTP_PASS ${FTP_PASS}
ENV GID=1000
ENV UID=1000

RUN apk add --no-cache --update vsftpd

COPY vsftpd.conf /etc

RUN addgroup -g ${GID} -S ${FTP_USER} && \
	adduser -D -G ${FTP_USER} -h /var/www/html -s /bin/false -u ${UID} ${FTP_USER} && \
	mkdir -p /var/www/html && \
	chown -R ${FTP_USER}:${FTP_USER} /var/www/html && \
	echo "${FTP_USER}:${FTP_PASS}" | /usr/sbin/chpasswd

EXPOSE 20 21 40000-40100

CMD /usr/sbin/vsftpd
