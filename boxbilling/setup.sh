#!/bin/sh

mv /invoiceplane/application/config /data
ln -sf /data/config /invoiceplane/application/config

mkdir /data/db
chown -R $UID:$GID /data/db
su-exec $UID:$GID mysql_install_db --datadir=/data/db --rpm

su-exec $UID:$GID mysqld &
sleep 5
DBPW=$(pwgen -1 32)
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"
mysql -e "DROP DATABASE test"
mysql -e "FLUSH PRIVILEGES"
mysql -e "CREATE DATABASE invoiceplane"
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$DBPW') WHERE User = 'root'"
killall mysqld

echo -e "\n*** Please enter the following in the database configuration ***"
echo -e "Hostname: locahost\nUsername: root\nPassword: $DBPW\nDatabase: invoiceplane"
echo -e "*** This is only printed once and not saved ***\n"