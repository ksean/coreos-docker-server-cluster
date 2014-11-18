FROM ubuntu:14.04

RUN mkdir /root/.ssh
ADD ../../../../config/ba_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/ba_rsa
RUN echo "Host bitbucket.org\n\tIdentityFile ~/.ssh/ba_rsa\n\tStrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

VOLUME ["/root/.ssh"]

CMD ["/bin/sh", "true"]