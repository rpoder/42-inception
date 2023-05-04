mysqld &


sleep 10

# service mysql start;

# while true
# do
#     mysqladmin ping > /dev/null ; echo $? ; mysqladmin ping > /dev/null
#     if [ $? -eq 0 ]; then
#         echo "mysqladmin is responding"
#         break
#     else
#         echo "mysqladmin is not responding, retrying..."
#         sleep 5
#     fi
# done

if [ ! -e "/var/lib/mysql/.already-exists" ] ; then

touch "/var/lib/mysql/.already-exists"
mysql -u root -e "CREATE DATABASE ${SQL_DATABASE_NAME};"
mysql -u root -e "CREATE USER '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -u root -e "USE '${SQL_DATABASE_NAME}'; GRANT ALL PRIVILEGES ON * TO '${SQL_USER_NAME}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
mysql -u root -p${SQL_USER_PASSWORD} -e "FLUSH PRIVILEGES"

else

echo "mysql is already initialized"

fi

mysqladmin -p${SQL_USER_PASSWORD} shutdown

exec mysqld
