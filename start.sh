#!/bin/bash

fleetctl start apache.service
fleetctl start etcd-amb-apache.service
fleetctl start apache-docker-reg.service
fleetctl start etcd-amb-apache2.service
fleetctl start apache-dyn-amb.service
fleetctl start haproxy.service