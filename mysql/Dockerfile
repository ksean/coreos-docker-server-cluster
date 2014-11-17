FROM ubuntu:14.04

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server-5.5

RUN rm -rf /var/lib/mysql/*

ADD charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
ADD my.cnf /etc/mysql/conf.d/my.cnf

ADD start.bash /start.bash
RUN chmod +x start.bash

VOLUME ["/etc/mysql", "/data/mysql"]

EXPOSE 3306

ENTRYPOINT ["/start.bash"]