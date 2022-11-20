#!/bin/sh

echo "in start_mariadb.sh"

service mysql start

# if ! [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then
# 	echo "Creating $MARIADB_DATABASE...."
# 	eval "echo \"$(cat ./50-server.cnf)\"" | mariadb
# else
# 	echo "$MARIADB_DATABASE already exists"
# fi

cat /var/lib/mysql/.setup 2> /dev/null

# 조건식 2가진 버전
# 1. if [ $? -ne 0 ]; then
if ! [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
# mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD < ./wp_dump.sql

touch /var/lib/mysql/.setup
fi
mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;
# service mysql stop

#pid 1로 만들어 줌
exec mysqld
# exec "$@"