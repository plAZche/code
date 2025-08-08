FROM alpine:3.10
RUN apk add --no-cache bash
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN apk update && apk add --no-cache curl
RUN chmod +x /app/code/yunoinstall.sh
CMD [ "/app/code/yunoinstall.sh" ]