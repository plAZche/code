FROM debian:12
RUN apt-get update && apt-get install -y bash
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y ca-certificates curl iputils-ping nginx postfix fail2ban slapd systemd wget && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/plazc/code/blob/main/yunoinstall.sh && \
    chmod +x ./yunoinstall.sh
CMD [ ".//yunoinstall.sh" ]
