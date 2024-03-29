#!/bin/bash

echo "Starting MariaDB..."
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

service mariadb start

sleep 1

echo "Configuring MariaDB..."
mysql_secure_installation << END

Y
$DB_ROOT_PASS
$DB_ROOT_PASS
Y
Y
Y
Y
END
    echo "MariaDB configured"
    echo "Creating database $DB_NAME..."
    sleep 1
    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
    mysql -u root -p$DB_ROOT_PASS -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$DB_ROOT_PASS shutdown

else
    sleep 1
    echo "The database $DB_NAME already exists."
fi

exec "$@"

