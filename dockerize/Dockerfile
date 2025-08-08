FROM yunohost/dev
RUN mkdir -p /app/code
COPY . /app/code
WORKDIR /app/code
RUN apt update && apt install -y curl ca-certificates
RUN chmod +x /app/code/yunoinstall.sh
CMD [ "/app/code/yunoinstall.sh" ]
END