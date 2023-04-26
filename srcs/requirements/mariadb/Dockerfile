FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y

RUN		apt install mariadb-server mariadb-client -y

RUN

EXPOSE	3306

# RUN		service mysql start;
# RUN		service mysql status

# CMD		mysqld_safe

COPY		conf/setup-maria.sh /tmp/setup-maria.sh
RUN			chmod +x /tmp/setup-maria.sh
# RUN			bash /tmp/setup-maria.sh
# RUN		mysql -e "CREATE DATABASE IF NOT EXISTS 'test'";
# RUN		mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE_NAME}\`";
# RUN		mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER_NAME}\`@'localhost' IDENTIFIED BY '${SQL_USER_PASSWORD}'";
# RUN		mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE_NAME}\`.* TO \`${SQL_USER_NAME}\`@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}'";
# RUN		mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${SQL_ROOT_PASSWORD}\`"

# COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server2.cnf
# RUN		mysql -e "FLUSH PRIVILEGES"

# RUN		mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown

# RUN		exec mysqld_safe
