FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y

RUN		apt install mariadb-server mariadb-client -y

EXPOSE	3306

# RUN		service mysql start;
# RUN		service mysql status

# CMD		mysqld_safe

COPY	conf/setup-maria.sh /tmp/setup-maria.sh
COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server2.cnf

ENV		SQL_DATABASE_NAME	inception_db
ENV		SQL_USER_NAME		rpoder
ENV		SQL_USER_PASSWORD	qwerty
ENV		SQL_ROOT_NAME		root
ENV		SQL_ROOT_PASSWORD	qwerty

RUN		chmod +x /tmp/setup-maria.sh
RUN		sh /tmp/setup-maria.sh


# RUN		mysqladmin -u root -p qwerty shutdown

# RUN		exec mysqld_safe
