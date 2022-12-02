FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install -y procps mariadb-server vim dumb-init
RUN	chmod +x /usr/bin/dumb-init
COPY tools/setup.sh .
RUN chmod +x setup.sh
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld


RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.cnf.d/
ENTRYPOINT ["/usr/bin/dumb-init", "--", "bash", "/setup.sh"]
EXPOSE 3306

