FROM ubuntu:14.04
MAINTAINER ksean

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 curl git

# Add github repo
RUN mkdir -p /app/kennedysean \
  && rm -rf /var/www/html \
  && ln -s /app/kennedysean /var/www \
  && git clone https://github.com/ksean/kennedysean.git /app/kennedysean
  
RUN chown -R root:www-data /var/www
RUN chown -R root:www-data /app

RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod deflate
RUN a2enmod headers

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

# Add site config
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
ADD kennedysean.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/kennedysean.conf /etc/apache2/sites-enabled/

# Add apache config
ADD apache2.conf /app/apache2.conf
RUN cp -f /app/apache2.conf /etc/apache2

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]