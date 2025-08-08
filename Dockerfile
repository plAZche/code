FROM debian:12
RUN apt-get update && apt-get install -y bash
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN apt update && apt install -y ca-certificates curl iputils-ping systemd nginx postfix dovecot fail2ban slapd && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /app/code/yunoinstall.sh
CMD [ "/app/code/yunoinstall.sh" ]
