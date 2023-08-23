
FROM alpine:latest

WORKDIR /dir1

# RUN apk add --no-cache --upgrade bash

RUN echo "this is data in 'myfile1'" > myfile1

# COPY . .
COPY infinite_print.sh .

# ENTRYPOINT [ "./params_print.sh" ]
# ENTRYPOINT [ "./finite_print.sh" ]

# CMD ["./finite_print.sh"]
CMD ["./infinite_print.sh"]
# CMD ["cat"]
# CMD ["cat", "myfile1"]

# docker run --rm --name mywebserver -p 4242:80 -d mynginximage

# 바인드마운트
# -v /home/admin/42_inception/testImage/mount1:/dir1/mount2