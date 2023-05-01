FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y

RUN		apt install mariadb-server mariadb-client -y

EXPOSE	3306

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server2.cnf
COPY	conf/setup-maria.sh /tmp/setup-maria.sh

RUN		chmod 777 /tmp/setup-maria.sh
# RUN		bash /tmp/setup-maria.sh


# RUN		mysqladmin -u root -p qwerty shutdown

CMD		exec mysqld
