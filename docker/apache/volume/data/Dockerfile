FROM ubuntu:14.04

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git

RUN mkdir -p /app/www/kennedysean \
 && rm -rf /var/www \
 && ln -s /app/www /var \
 && git clone https://github.com/ksean/kennedysean.git /app/www/kennedysean

VOLUME ["/var/www"]

CMD ["/bin/sh", "true"]