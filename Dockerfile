FROM debian:12
RUN apt-get update && apt-get install -y bash
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN apt-get update && apt-get install -y curl ca-certificates
RUN chmod +x /app/code/yunoinstall.sh
CMD [ "/app/code/yunoinstall.sh" ]