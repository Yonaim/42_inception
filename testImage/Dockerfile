FROM alpine:latest

WORKDIR /dir1

RUN apk add --no-cache --upgrade bash
RUN echo "this is data in 'myfile1'" > myfile1

COPY . .

# CMD ["./finite_print.sh"]
CMD ["./infinite_print.sh"]

# docker run --rm --name mywebserver -p 4242:80 -d mynginximage