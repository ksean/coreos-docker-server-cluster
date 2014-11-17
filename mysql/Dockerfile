FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server

VOLUME ["/data"]

ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD start.bash /start.bash
RUN chmod +x start.bash

EXPOSE 3306

ENTRYPOINT ["/start.bash"]