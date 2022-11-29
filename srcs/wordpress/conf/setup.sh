#!bin/bash

mkdir -p /var/www/ && mkdir -p /var/www/wordpress
# mkdir /var/www/wordpress/wp-content/upgrade
# mkdir /var/www/wordpress/wp-content/uploads
# mkdir /var/www/wordpress/wp-content/temp
chown -R www-data:www-data /var/www/wordpress/
chmod -R 775 /var/www/wordpress/
cd /var/www/wordpress
wp core download --allow-root
cp -rf /tmp/wp-config.php /var/www/wordpress/

# wordpress 권한을 nginx에게 넘겨주기

# www-data:www-data 로 권한을 주는 이유
#    www-data Ubuntu의 웹 서버(예: Apache, nginx)가 정상 작동을 위해 기본적으로 사용하는 사용자. 
#   웹서버 프로세스는 액세스할 수 있는 모든 파일에 www-data 액세스할 수 있습니다. 다른 중요성은 없다.
#   일부 웹 서버는 www-data로 실행됩니다.
#   첫째로 nginx (www-data 사용자)가 워드프레스 폴더 및 파일에대한 편집권한이 없으면 업데이트,
#   플러그 및 테마 설치와 업데이트등에 문제가 생겨 오류가 나기때문에 chown 로  권한을 변경.
#   -R 옵션은 모든 하위폴더 및 파일을 포함한다는 뜻입니다.
# chown -R www-data:www-data /var/www/wordpress/
# chmod -R 777 /var/www/wordpress/

# wp core 구축
# --allow-root
# 루트로 실행되는 도커 컨테이너 내에서 wp-cli사용시, 관리자 권한을 허용한다는 의미.
wp core install --allow-root --admin_user=kbaek --admin_password=1234 \
    --admin_email=kbaek@student.42seoul.fr --url=kbaek.42.fr --title='WordPress'
echo "env[MYSQL_DATABASE] = \$MYSQL_DATABASE" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_USER] = \$MYSQL_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_PASSWORD] = \$MYSQL_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec php-fpm7.3 -F