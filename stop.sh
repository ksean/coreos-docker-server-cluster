#!/bin/bash

#HAProxy
fleetctl stop ./service/core/haproxy.service
fleetctl stop ./service/etcd/etcd-haproxy.service
fleetctl stop ./service/dynamic/dyn-apache.service
fleetctl stop ./service/dynamic/dyn-mysql.service

#MySQL
fleetctl stop ./service/core/mysql.service
fleetctl stop ./service/etcd/etcd-mysql.service
fleetctl stop ./service/register/mysql-reg.service

#Apache
fleetctl stop ./service/core/apache.service
fleetctl stop ./service/etcd/etcd-apache.service
fleetctl stop ./service/register/apache-reg.service
