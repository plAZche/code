FROM debian:12
RUN apt-get update && apt-get install -y bash
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN apt update && apt install -y ca-certificates curl iputils-ping systemd nginx postfix fail2ban slapd && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /app/code/yunoinstall.sh
CMD [ "/app/code/yunoinstall.sh" ]
