# 1. db 설정
# 2. 유저 생성 (관리자, 일반유저)

# Create wp-config.php (Configuration file of wordpress)
wp core config	--dbhost=$DB_HOST \
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

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

# exec php-fpm81 -F
exec sleep infinity