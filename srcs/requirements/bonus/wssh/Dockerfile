FROM alpine:3.17.3

ARG FTP_PASS

ENV FTP_PASS=${FTP_PASS}

RUN apk add --no-cache --update python3 && python -m ensurepip && python -m pip install webssh
RUN apk add --no-cache openssh && \
	ssh-keygen -A && \
	mkdir -p /root/.ssh /var/run/sshd && \
	chmod 0700 /root/.ssh && \
	echo "root:${FTP_PASS}" | chpasswd && \
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# CMD ["/usr/sbin/sshd", "-D", "-e"]
# CMD ["wssh", "--address=0.0.0.0", "--port=8888"]
CMD ["sh", "-c", "/usr/sbin/sshd && wssh --address=0.0.0.0 --port=8888"]
