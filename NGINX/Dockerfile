FROM alpine:3.17

WORKDIR /

# Install the Nginx web server
RUN apk update
RUN apk add nginx

# Create the user and Nginx directory
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

# Generate a self-signed SSL(TLS) certificate
RUN apk add openssl curl
RUN mkdir -p /etc/nginx/ssl \
	&& cd /etc/nginx/ssl \
	# # private key and corresponding public key:
	&& openssl genpkey -algorithm RSA -out private_key.pem \
	&& openssl rsa -pubout -in private_key.pem -out public_key.pem \
	# Certificate Signing Request (CSR) file:
	&& openssl req -new -key private_key.pem -out certificate_request.csr \
	-subj "/C=KR/ST=Seoul/L=City/O=YONA Inc./CN=yona.co.kr" \
	# certificate (.crt) file using the CSR file:
	&& openssl x509 -req -in certificate_request.csr -signkey private_key.pem -out certificate.crt \
	-days 365
WORKDIR /etc/nginx

COPY ./src ./src
COPY ./http.d ./http.d

RUN ["cp", "./src/test_nginx.conf", "./nginx.conf"]
# RUN ["cp", "./src/customed_nginx.conf",  "./nginx.conf"]

EXPOSE 4242 443

CMD ["nginx", "-g", "daemon off;"]
