#!/bin/bash

if [ ! -d /data/mysql ]; then
    mysql_install_db --datadir=/data/mysql
    echo "1. Starting MySQL"
    /usr/bin/mysqld_safe --datadir=/data/mysql > /dev/null 2>&1 &

    RET=1
    while [[ $RET -ne 0 ]]; do
        echo "- Waiting for confirmation of MySQL service startup"
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done

    PASS='temp123'
    echo "2. Creating MySQL user"
    mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
    mysql -uroot -e "CREATE DATABASE wordpress"

    echo "3. Shutting down after setup"
    mysqladmin -uroot shutdown
else

echo "=> Running MySQL Server"
exec mysqld_safe --datadir=/data/mysql