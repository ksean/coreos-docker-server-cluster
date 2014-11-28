FROM ubuntu:14.04

RUN sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list \
 && apt-get -y update \
 && apt-get install -y haproxy=1.5.3-1~ubuntu14.04.1 curl \
 && sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy \
 && rm -rf /var/lib/apt/lists/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.bash /haproxy-start

VOLUME ["/haproxy-override"]

WORKDIR /etc/haproxy

EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["bash", "/haproxy-start"]