FROM		debian:buster

MAINTAINER	Ronan PODER @rpoder

RUN			apt-get update -y
RUN			apt-get upgrade -y

RUN			apt-get install -y wget

RUN			apt-get install -y php7.3 php7.3-fpm php-fpm php-mysql mariadb-client

# configure php
COPY		conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# set env
ENV			SQL_DATABASE_NAME	test
ENV			SQL_USER_NAME		test
ENV			SQL_USER_PASSWORD	Azerty1234
ENV			WP_TITLE			mywebsite
ENV			WP_ADMIN_USR		admin
ENV			WP_ADMIN_PWD		Admin1234
ENV			WP_ADMIN_EMAIL		admin@admin.com
ENV			WP_USR				user2
ENV			WP_EMAIL			user2@student.42.fr
ENV			WP_PWD				Azerty1234

# get worpress and extract
RUN			wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN			cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN			chown -R root:root /var/www/wordpress

# get and install wordpress config CLI
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

RUN			mkdir /run/php

COPY		conf/auto-config.sh /tmp/auto-config.sh

RUN			sh /tmp/auto-config.sh

EXPOSE		9000

CMD			php-fpm7.3 --nodaemonize --allow-to-run-as-root
