FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y

RUN		apt install mariadb-server mariadb-client -y


RUN		mkdir -p /run/mysqld
RUN		chown -R mysql:mysql /run/mysqld

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server2.cnf
COPY	conf/setup-maria.sh /tmp/setup-maria.sh

RUN		chmod 777 /tmp/setup-maria.sh

EXPOSE	3306

ENV SQL_DATABASE_NAME 'test'
ENV SQL_USER_NAME 'test'
ENV SQL_USER_PASSWORD 'Azerty1234'
ENV SQL_ROOT_PASSWORD 'Azerty1234'
ENV DOMAIN_NAME 'localhost'
ENV WP_TITLE mywebsite
ENV WP_ADMIN_USR admin
ENV WP_ADMIN_PWD Admin1234
ENV WP_ADMIN_EMAIL admin@admin.com
ENV WP_USR user2
ENV WP_EMAIL user2@student.42.fr
ENV WP_PWD Azerty1234

# RUN		mysqladmin -u root -p qwerty shutdown

CMD		bash /tmp/setup-maria.sh
CMD		service mysql start
