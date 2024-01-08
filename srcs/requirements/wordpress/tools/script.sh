mkdir -p /var/www/html
chmod +x /usr/local/bin/wp
grep -q "^www-data:" /etc/group || addgroup -g 81 -S www-data
adduser -u 81 -D -S -G www-data www-data
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

if [ ! -d "/var/www/html/wp-admin" ]; then
	echo "start wordpress installation and configure"
	wp core download --path=/var/www/html
	sleep 10
	cd /var/www/html
	# Create wp-config.php (Configuration file of wordpress)
	wp core config --dbhost=$DB_HOST \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_USER_PWD \
					--allow-root
	# Initializing a WordPress site
	wp core install --title=$WP_TITLE \
					--admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PWD \
					--admin_email=$WP_ADMIN_EMAIL \
					--url=$WP_URL \
					--allow-root
	# create another user
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
fi

exec php-fpm81 -F
