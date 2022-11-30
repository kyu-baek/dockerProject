# 순서
# 1. 이미지 불러오기
# 2. 각종 php, wp관련 패키지 다운
# 3. wp-cli설치
# 4. 권한설정
# 5. php포트설정
# 6. 포트

FROM debian:buster

        # sendmail \
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y \
        php7.3-fpm \
        php-mysql \
        mariadb-client \
        wget \
        dumb-init

RUN chmod +x /usr/bin/dumb-init

# 3. wp-cli설치
# wp-cli는 wordpress관리자에서 수행 할 수 있는 여러 작업에 대한 명령 줄 인터페이스를 제공합니다.
# 예를 들어 wp plugin install —activate를 사용하면 wordpress 플러그인을 설치하고 활성화 할 수 있습니다.
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 4. 권한설정
# 권한  설설정  후 명령 줄에서 WP-CLI를 사용하려면 wp파일을 실행 가능하게 만들고
# PATH의 /usr/local/bin/wp로 이동한다.
RUN     chmod 777 wp-cli.phar && mv wp-cli.phar /usr/bin/wp && \
	    chmod +x /usr/bin/wp


COPY    conf/wp-config.php /tmp/
COPY    conf/setup.sh .
RUN     chmod +x setup.sh

EXPOSE 9000

# WORKDIR /var/www/wordpress
ENTRYPOINT ["/usr/bin/dumb-init", "--", "sh", "/setup.sh"]