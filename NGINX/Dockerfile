FROM alpine:3.17

WORKDIR /

# Install the Nginx web server
RUN apk update
RUN apk add nginx

# Create the user and Nginx directory
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# 그룹명 다른걸로 바꾸려니까 이미지 빌드할때 오류뜬다 뭐지? 일단 넘어가고 나중에 자세히 보자

# Generate a self-signed 
RUN mkdir -p /etc/nginx/ssl \
    && openssl req -nodes -x509 -sha256 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/minseok2.42.fr.key \
    -out /etc/nginx/ssl/minseok2.42.fr.crt \
    -days 356 \
    -subj "/CN=minseok2.42.fr" \
    && openssl dhparam -out /etc/nginx/ssl/minseok2.42.fr.dhparam.pem 1024

# backup original configuration file
# RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

# Add daemon off option to configuration file
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# COPY ./src /etc/nginx/src

WORKDIR /etc/nginx

# RUN ["cp", "./src/mynginx.conf", "./nginx.conf"]

EXPOSE 4242

# run nginx
# WORKDIR /etc/nginx
CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx"]
# CMD ["cat", "nginx.conf"]
# CMD ["echo", "what???"]

# -g 'Nginx www user' : Set general information about the account wwwcbz
# -h /home/www/ : The account home directory
# wwwcbz : The account name

# 3. Nginx configuration

# docker build -t mynginx ./NGINX
# docker run --rm --name mywebserver -p 4242:80 mynginx
# docker run --rm --name mywebserver -v /home/admin/42_inception/NGINX/mounted:/etc/nginx -p 4242:80 mynginx
