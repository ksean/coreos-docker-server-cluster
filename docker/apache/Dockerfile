# Build using ubuntu 14.04 image
FROM ubuntu:14.04

# Author
MAINTAINER ksean

# Update packages
RUN apt-get -y update

# Install apache and php
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 php5 libapache2-mod-php5 php5-mcrypt

# Install mysql mods
RUN apt-get -y install libapache2-mod-auth-mysql php5-mysql

RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod headers

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

# Add site config
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
ADD vhost/kennedysean.conf /etc/apache2/sites-available/kennedysean.conf
ADD vhost/northofthegrid.conf /etc/apache2/sites-available/northofthegrid.conf
RUN ln -s /etc/apache2/sites-available/kennedysean.conf /etc/apache2/sites-enabled/
RUN ln -s /etc/apache2/sites-available/northofthegrid.conf /etc/apache2/sites-enabled/

# Add apache config
ADD apache2.conf /root/apache2.conf
RUN cp -f /root/apache2.conf /etc/apache2

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]