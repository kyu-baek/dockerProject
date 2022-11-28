#!/bin/sh

chown -R 777 /var/lib/mysql/

chown -R mysql:mysql /var/lib/mysql/

FILE="/var/lib/mysql/$MYSQL_DATABASE"
service mysql start
if [ ! -f "$FILE" ]; then
    

    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;";
    mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';";
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';";
    mysql -e "FLUSH PRIVILEGES;";

    mysql -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";
    mysql -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;";

    mysql -hlocalhost $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD;
    
fi
mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown;
exec mysqld_safe

# echo "in start_mariadb.sh"

# service mysql start;

# # cat /var/lib/mysql/.setup 2> /dev/null
# echo "come0"
# if ! [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
# echo "come"
# mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWORD}'";
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'";
# mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MYSQL_PASSWORD}') WHERE User = 'root'";
# mysql -e "FLUSH PRIVILEGES";

# # mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
# # mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
# # mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
# # mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
# # mysql -e "FLUSH PRIVILEGES";
# # mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;
# echo "come1"
# touch /var/lib/mysql/.setup
# fi
# echo "come2"
# mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;
# # mysql $MYSQL_DATABASE -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD;
# echo "come3"
# exec mysqld




# service mysql start

# if ! [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]; then
# 	echo "Creating $MARIADB_DATABASE...."
# 	eval "echo \"$(cat ./50-server.cnf)\"" | mariadb
# else
# 	echo "$MARIADB_DATABASE already exists"
# fi

# cat /var/lib/mysql/.setup 2> /dev/null

# # 조건식 2가진 버전
# if [ $? -ne 0 ]; then
# # if ! [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
# mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
# mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
# mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
# mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
# mysql -e "FLUSH PRIVILEGES";
# mysql -e "mysql $MYSQL_DATABASE -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD"

# touch /var/lib/mysql/.setup
# fi
# sleep 3
# mhsql $MYSQL_DATABASE -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD;
# mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;
# # service mysql stop

# #pid 1로 만들어 줌
# exec mysqld
# exec "$@"