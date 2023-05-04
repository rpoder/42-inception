FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install mariadb-server mariadb-client -y

RUN		mkdir -p /run/mysqld
RUN		chown -R mysql:mysql /run/mysqld

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/setup-maria.sh /tmp/setup-maria.sh

RUN		chmod 777 /tmp/setup-maria.sh

CMD		bash /tmp/setup-maria.sh
