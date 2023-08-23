FROM alpine

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

# backup original configuration file
# RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

# Add daemon off option to configuration file
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# run nginx
WORKDIR /etc/nginx
# CMD ["nginx"]
CMD ["ls"]
# CMD ["echo", "what???"]

# -g 'Nginx www user' : Set general information about the account wwwcbz
# -h /home/www/ : The account home directory
# wwwcbz : The account name

# 3. Nginx configuration

# docker run --rm -d --name mywebserver -v /home/admin/42_inception/NGINX/mounted:/etc/nginx -p 4242:80 mynginx