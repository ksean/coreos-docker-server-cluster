#!/bin/bash

#HAProxy
if [ "$1" = "haproxy" ] || [ "$1" = "all" ]; then
    fleetctl $2 ./service/core/haproxy.service
    fleetctl $2 ./service/etcd/etcd-haproxy.service
    fleetctl $2 ./service/dynamic/dyn-apache.service
fi

#Apache
if [ "$1" = "apache" ] || [ "$1" = "all" ]; then
    fleetctl $2 ./service/core/apache.service
    fleetctl $2 ./service/etcd/etcd-apache.service
    fleetctl $2 ./service/register/reg-apache.service
fi

#Jenkins
if [ "$1" = "jenkins" ] || [ "$1" = "all" ]; then
    fleetctl $2 ./service/core/jenkins.service
    fleetctl $2 ./service/etcd/etcd-jenkins.service
    fleetctl $2 ./service/register/reg-jenkins.service
fi

#Build
if [ "$1" = "build" ]; then
    docker build --no-cache -t="ksean/apache" ./docker/apache
    docker build --no-cache -t="ksean/apache-data" ./docker/apache/volume/data
    docker build --no-cache -t="ksean/apache-log" ./docker/apache/volume/log
    docker build --no-cache -t="ksean/haproxy" ./docker/haproxy
    docker build --no-cache -t="ksean/jenkins" ./docker/jenkins
    docker build --no-cache -t="ksean/jenkins-log" ./docker/jenkins/volume/log
    docker push ksean/apache
    docker push ksean/apache-data
    docker push ksean/apache-log
    docker push ksean/haproxy
    docker push ksean/jenkins
    docker push ksean/jenkins-log
fi