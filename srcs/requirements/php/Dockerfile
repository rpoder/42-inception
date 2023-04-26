FROM		debian:buster

MAINTAINER	Ronan PODER @rpoder

RUN			apt update -y
RUN			apt upgrade -y

# COPY		files/index.html /var/www/index.html
COPY		files/index.php /var/www/index.php
RUN			apt-get install -y php7.3-fpm php7.3
RUN			rm -rf /var/lib/apt/lists/*

COPY		conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN			mkdir /run/php

EXPOSE		9000

CMD			php-fpm7.3 --nodaemonize --allow-to-run-as-root
