if [ ! -e "/var/www/wordpress/wp-config.php" ] ; then

	wp	core download	--allow-root \
						--path='/var/www/wordpress' \
						--extract


	wp	config create	--allow-root \
						--dbname="$SQL_DATABASE_NAME" \
						--dbuser="$SQL_USER_NAME" \
						--dbpass="$SQL_USER_PASSWORD" \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

	until wp db check --path=/data/www/wordpress --allow-root --quiet; do
		sleep 5
	done

	wp	core install	--allow-root \
						--url=$DOMAIN_NAME/ \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN_USR \
						--admin_password=$WP_ADMIN_PWD \
						--admin_email=$WP_ADMIN_EMAIL \
						--skip-email \
						--path='/var/www/wordpress'

	wp user create		--allow-root \
						$WP_USR $WP_EMAIL \
						--user_pass=$WP_PWD \
						--role=author \
						--path='/var/www/wordpress'

else

	echo "wordpress files already exist"

fi
#wp redis enable		--allow-root \

