sleep	20

wp	config create	--allow-root \
					--dbname=$SQL_DATABASE_NAME \
					--dbuser=$SQL_USER_NAME \
					--dbpass=$SQL_USER_PASSWORD \
					--dbhost=mariadb::3306 \
					--path='/var/www/wordpress' \

wp	core install	--allow-root \
					--url=$DOMAIN_NAME/ \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_USR \
					--admin_password=$WP_ADMIN_PWD \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email \
					--path='/var/www/wordpress' \

wp user create		--allow-root \
					$WP_USR $WP_EMAIL \
					--user_pass=$WP_PWD \
					--role=author \
					--path='/var/www/wordpress' \


#wp redis enable		--allow-root \

