FROM nginx:stable

WORKDIR /yona

COPY ./src/html ./html

COPY ./src .

WORKDIR /

EXPOSE 80

# CMD ["echo", "aaa"]
# 바인드마운트
# -v /home/admin/42_inception/NGINX/mounted:/webserver
# -v /home/admin/42_inception/NGINX/mounted:/etc/nginx