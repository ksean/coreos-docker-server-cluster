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