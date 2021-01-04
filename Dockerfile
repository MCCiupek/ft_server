FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	nginx \
	mariadb-server \
	mariadb-client \
	php-cli \
	php-curl \
	php-intl \
	php-fpm \
	php-mysql \
	openssl

COPY srcs/ ./root/

WORKDIR /root/

EXPOSE 80 443

ENTRYPOINT ["bash", "entry_point.sh"]
