#!/bin/bash

#HAProxy
fleetctl destroy ./service/core/haproxy.service
fleetctl destroy ./service/etcd/etcd-haproxy.service
fleetctl destroy ./service/dynamic/dyn-apache.service
fleetctl destroy ./service/dynamic/dyn-mysql.service

#MySQL
fleetctl destroy ./service/core/mysql.service
fleetctl destroy ./service/etcd/etcd-mysql.service
fleetctl destroy ./service/register/mysql-reg.service

#Apache
fleetctl destroy ./service/core/apache.service
fleetctl destroy ./service/etcd/etcd-apache.service
fleetctl destroy ./service/register/apache-reg.service
