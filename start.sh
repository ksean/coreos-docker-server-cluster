#!/bin/bash

#HAProxy
fleetctl start ./service/core/haproxy.service
fleetctl start ./service/etcd/etcd-haproxy.service
fleetctl start ./service/dynamic/dyn-apache.service
fleetctl start ./service/dynamic/dyn-mysql.service

#MySQL
fleetctl start ./service/core/mysql.service
fleetctl start ./service/etcd/etcd-mysql.service
fleetctl start ./service/register/mysql-reg.service

#Apache
fleetctl start ./service/core/apache.service
fleetctl start ./service/etcd/etcd-apache.service
fleetctl start ./service/register/apache-reg.service
