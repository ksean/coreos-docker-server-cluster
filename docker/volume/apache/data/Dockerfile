FROM ubuntu:14.04

RUN mkdir /root/.ssh
ADD config/ba_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/ba_rsa
RUN mkdir /etc/ssh
RUN echo "Host bitbucket.org\n\tIdentityFile ~/.ssh/ba_rsa\n\tStrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

RUN mkdir -p /app/www/kennedysean \
 && mkdir /app/www/northofthegrid \
 && rm -rf /var/www \
 && ln -s /app/www /var \
 && git clone https://github.com/ksean/kennedysean.git /app/www/kennedysean \
 && git clone -b feature_coreos git@bitbucket.org:byteamp/northofthegrid.com.git /app/www/northofthegrid

VOLUME ["/var/www"]

CMD ["/bin/sh", "true"]