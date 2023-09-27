mysql -u root -p$DB_ADMIN_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ADMIN_PWD}';"
mysql -u root -p$DB_ADMIN_PWD -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root -p$DB_ADMIN_PWD -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PWD}';"
mysql -u root -p$DB_ADMIN_PWD -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -p$DB_ADMIN_PWD -e "FLUSH PRIVILEGES;"

pkill mariadbd

exec mariadbd --user=mysql