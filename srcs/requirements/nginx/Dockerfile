FROM alpine:3.18

WORKDIR /

# Install the required packages
RUN apk update \
	&& apk add nginx \
	&& apk add openssl curl

# Generate a self-signed SSL(TLS) certificate
RUN mkdir -p /etc/nginx/ssl \
	&& cd /etc/nginx/ssl \
	&& openssl genpkey -algorithm RSA -out private_key.pem \
	&& openssl rsa -pubout -in private_key.pem -out public_key.pem \
	&& openssl req -new -key private_key.pem -out certificate_request.csr \
	-subj "/C=KR/ST=Seoul/L=City/O=YONA Inc./CN=yona.co.kr" \
	&& openssl x509 -req -in certificate_request.csr -signkey private_key.pem \
	-days 365 -out certificate.crt

# Set Nginx configuration file
COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY /conf/http.d /etc/nginx/http.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]