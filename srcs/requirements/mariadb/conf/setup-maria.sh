mysqld &

echo "a"

sleep 10

echo "b"


if [ ! -e "/var/lib/mysql/.already-exists" ] ; then

touch "/var/lib/mysql/.already-exists"

mysql -u root -e "CREATE DATABASE ${SQL_DATABASE_NAME};"

echo "c"
mysql -u root -e "CREATE USER '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

echo "d"
mysql -u root -e "USE '${SQL_DATABASE_NAME}'; GRANT ALL PRIVILEGES ON * TO '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

echo "e"
mysql -u root -e "FLUSH PRIVILEGES"

echo "f"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

echo "g"
mysql -u root -p${SQL_USER_PASSWORD} -e "FLUSH PRIVILEGES"

echo "before shutdown"

else

echo "mariadb files already exist"

fi

mysqladmin -p${SQL_USER_PASSWORD} shutdown

echo "after shutdown"


exec mysqld
