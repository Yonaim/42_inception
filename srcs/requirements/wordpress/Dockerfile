FROM alpine:3.18

WORKDIR /

RUN apk update \
	&& wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 \
	&& chmod +x /usr/bin/dumb-init \
	&& apk add php81 php81-fpm php81-openssl php81-phar curl \
	&& export PATH=$PATH:/usr/sbin/php-fpm81

# Install wp-cli (Wordpress CLI)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html \
	&& cd /var/www/html \
	&& wp core download

# Set configuration file
COPY ./conf/www.conf /etc/php81/php-fpm.d

# Copy script file and set dumb-init as PID 1
COPY ./tools/script.sh /
RUN  chmod +x /script.sh
ENTRYPOINT ["dumb-init", "--"]

EXPOSE 9000

CMD [ "sh", "-c", "/script.sh" ]