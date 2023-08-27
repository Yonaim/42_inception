# Alpine Linux 기반 이미지 선택
FROM alpine:3.18

# 필요한 패키지 설치
RUN apk update \
	&& apk add php81-fpm curl \
	&& export PATH=$PATH:/usr/sbin/php-fpm81

# 작업 디렉토리 설정
WORKDIR /var/www/html

# WordPress 다운로드 및 설치
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz

# PHP-FPM 설정 파일 복사
COPY /conf/php-fpm.conf /etc/php81/php-fpm.conf

EXPOSE 9000

# PHP-FPM 실행
CMD ["php-fpm8.1", "-F"]
