#!/bin/sh

sed -i -e "s~<INVOICEPLANE_URL>~$INVOICEPLANE_URL~g" /invoiceplane/application/config/config.php \
       -e "s~<TZ>~$TZ~g" /etc/php7/php-fpm.conf


for dir in /invoiceplane /data /etc/nginx /etc/php5 /var/log /var/log/mysql /var/lib/nginx /run/mysqld /tmp /etc/s6.d; do
  if [ ! -d $dir ]; then
    mkdir -p $dir
  fi
  if $(find $dir ! -user $UID -o ! -group $GID|egrep '.' -q); then
    chown -R $UID:$GID $dir
  fi
done


if [ ! -f /data/config/config.php ]; then
  echo "New installation, executing the setup"
  /usr/local/bin/setup.sh
fi

exec su-exec $UID:$GID /bin/s6-svscan /etc/s6.d