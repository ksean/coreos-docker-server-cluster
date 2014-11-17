#!/bin/bash

source ./config/config

chmod 644 /etc/mysql/conf.d/mysqld_charset.cnf
chmod 644 /etc/mysql/conf.d/my.cnf

if [ ! -d /data/mysql ]; then
    mysql_install_db --datadir=/data/mysql
    echo "1. Starting MySQL"
    /usr/bin/mysqld_safe --datadir=/data/mysql> /dev/null 2>&1 &

    RET=1
    while [[ $RET -ne 0 ]]; do
        echo "- Waiting for confirmation of MySQL service startup"
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done

    echo "2. Creating MySQL admin"
    mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$ADMIN_PASS'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

    echo "3. Creating wordpress user"
    mysql -uroot -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY '$WORDPRESS_PASS'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' WITH GRANT OPTION"
    mysql -uroot -e "CREATE DATABASE wordpress"

    echo "4. Shutting down after setup"
    mysqladmin -uroot shutdown
else

echo "=> Running MySQL Server"
exec mysqld_safe --datadir=/data/mysql