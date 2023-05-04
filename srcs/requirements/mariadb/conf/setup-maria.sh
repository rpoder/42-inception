mysqld &

until mysqladmin ping;
do
	sleep 1
done

if [ ! -e "/var/lib/mysql/.already-exists" ] ; then
	mysql -u root -e "CREATE DATABASE ${SQL_DATABASE_NAME};"
	mysql -u root -e "CREATE USER '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
	mysql -u root -e "USE '${SQL_DATABASE_NAME}'; GRANT ALL PRIVILEGES ON * TO '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
	mysql -u root -e "FLUSH PRIVILEGES"
	mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
	mysql -u root -p${SQL_USER_PASSWORD} -e "FLUSH PRIVILEGES"
	touch "/var/lib/mysql/.already-exists"
else
	echo "mysql is already initialized"
fi

mysqladmin -p${SQL_USER_PASSWORD} shutdown

exec mysqld
