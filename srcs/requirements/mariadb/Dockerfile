FROM alpine:3.18

WORKDIR /

# Install the required packages
RUN apk update \
	&& wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 \
	&& chmod +x /usr/bin/dumb-init \
    && apk add mariadb mariadb-client

# Set configuration file
COPY ./conf/my.cnf /etc/

# Copy script file and set dumb-init as PID 1
COPY ./tools/script.sh /
RUN  chmod +x /script.sh
ENTRYPOINT ["dumb-init", "--"]

EXPOSE 3306

CMD [ "sh", "-c", "/script.sh" ]
