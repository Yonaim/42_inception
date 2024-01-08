mkdir -p /run/mysqld/
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql/
chmod -R 770 /var/lib/mysql/

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mariadbd --user=mysql &
	sleep 5
fi

mysql -u root -p$DB_ADMIN_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ADMIN_PWD}';"
mysql -u root -p$DB_ADMIN_PWD -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root -p$DB_ADMIN_PWD -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';"
mysql -u root -p$DB_ADMIN_PWD -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -p$DB_ADMIN_PWD -e "FLUSH PRIVILEGES;"

pkill mariadbd
sleep 3

exec mariadbd --user=mysql
