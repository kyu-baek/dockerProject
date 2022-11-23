
# FROM debian:buster

# RUN apt-get update -y \
#     && apt-get upgrade -y \
#     && apt-get install -y mariadb-server vim dumb-init
# RUN	chmod +x /usr/bin/dumb-init

# COPY conf/50-server.conf /etc/mysql/mariadb.conf.d
# COPY tools/setup.sh .
# RUN chmod +x setup.sh

# EXPOSE 3306
# RUN rm /etc/mysql/mariadb.conf.d/50-server.conf
# ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
# CMD         [ "bash", "/setup.sh" ]
# # ENTRYPOINT ["/usr/bin/dumb-init", "--", "bash", "/setup.sh"]


FROM debian:buster

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y mariadb-server vim dumb-init ;
# RUN	chmod +x /usr/bin/dumb-init
# RUN sleep 10
# RUN	chmod 777 /run/mysqld/docker.sock
# RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY conf/50-server.conf /etc/mysql/mariadb.cnf.d
COPY tools/setup.sh .
RUN chmod +x setup.sh

ENV MYSQL_ROOT_USER=root
ENV MYSQL_ROOT_PASSWORD=1111
ENV MYSQL_DATABASE=inception
ENV MYSQL_USER=kbaek
ENV MYSQL_PASSWORD=1234

EXPOSE 3306
COPY conf/50-server.conf /etc/mysql/mariadb.cnf.d
ENTRYPOINT ["bash", "/setup.sh"]
