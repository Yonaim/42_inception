FROM alpine:3.18

WORKDIR /

# Install the required packages
RUN apk update \
	&& wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 \
	&& chmod +x /usr/bin/dumb-init \
	&& apk add mariadb-client php81-mysqli php81 php81-fpm php81-openssl php81-phar curl php-iconv php-mbstring

# Install wp-cli (Wordpress CLI)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Set configuration file
COPY ./conf/www.conf /etc/php81/php-fpm.d

# Copy script file and set dumb-init as PID 1
COPY ./tools/script.sh /
RUN  chmod +x /script.sh
ENTRYPOINT ["dumb-init", "--"]

EXPOSE 9000

CMD [ "sh", "-c", "/script.sh" ]
