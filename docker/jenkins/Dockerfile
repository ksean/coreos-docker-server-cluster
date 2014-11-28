FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y wget
RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - \
 && sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' \
 && apt-get update -y \
 && apt-get install -y jenkins

CMD ["/etc/init.d/jenkins"]