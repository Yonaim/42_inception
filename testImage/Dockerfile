
FROM alpine:latest

WORKDIR /dir1

# RUN apk add --no-cache --upgrade bash
# RUN echo "this is data in 'myfile1'" > myfile1
RUN apk add dumb-init

COPY . .
# COPY infinite_print.sh .

# ENTRYPOINT [ "./params_print.sh" ]
# ENTRYPOINT [ "./finite_print.sh" ]
ENTRYPOINT ["/usr/bin/dumb-init","--","./finite_print.sh"]
	# Usage: /usr/bin/dumb-init [option] program [args]
	왜죠
	저 밥 사러 다녀오기 내기 걸렸는데 님이 오늘 충성을 다한다고해서 
	데리러옴 
	........................................
	그걸 지금...................
	와 상상도 못했다
	제이고님 혼자인가요?????????
	헤유킴님도 였는데 다리다쳐서 혼자감 
	.........................

# CMD ["./finite_print.sh"]
CMD ["./infinite_print.sh"]
# CMD ["cat"]
# CMD ["cat", "myfile1"]

# docker run --rm --name mywebserver -p 4242:80 -d mynginximage

# 바인드마운트
# -v /home/admin/42_inception/testImage/mount1:/dir1/mount2