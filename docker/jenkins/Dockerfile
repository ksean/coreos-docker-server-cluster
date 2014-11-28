FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y openjdk-7-jre-headless

ADD http://mirrors.jenkins-ci.org/war/1.591/jenkins.war /home/root/jenkins.war
RUN chmod 644 /home/root/jenkins.war

ENV JENKINS_HOME /jenkins

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/home/root/jenkins.war"]

CMD [""]