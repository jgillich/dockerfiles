#!/bin/bash

cat includes/banner
source includes/versions
source includes/functions.sh

source mailcow.config

checkports
checkconfig

installtask environment

returnwait "Certificate configuration"
installtask ssl

returnwait "MySQL configuration"
installtask mysql

returnwait "Postfix configuration"
installtask postfix

returnwait "Dovecot configuration"
installtask dovecot

returnwait "FuGlu configuration"
installtask fuglu

returnwait "ClamAV configuration"
installtask clamav

returnwait "Spamassassin configuration"
installtask spamassassin

returnwait "Webserver configuration"
installtask webserver

if [[ ${mailing_platform} == "roundcube" ]]; then
	returnwait "Roundcube configuration"
	installtask roundcube
else
	returnwait "SOGo configuration"
	installtask sogo
fi

returnwait "OpenDKIM configuration"
installtask opendkim

returnwait "Restarting services"
installtask restartservices

if [[ ${use_lets_encrypt} == "yes" ]]; then
	returnwait "Obtain Let's Encrypt signed certificates"
	installtask ssl_le
fi

returnwait "Finish installation" "no"

echo ${mailcow_version}_${mailing_platform} > /etc/mailcow_version

echo ---------------------------------
echo MySQL database host: ${my_dbhost}
echo ---------------------------------
echo MySQL mailcow database: ${my_mailcowdb}
echo MySQL mailcow username: ${my_mailcowuser}
echo MySQL mailcow password: ${my_mailcowpass}
echo ---------------------------------
if [[ ${mailing_platform} == "roundcube" ]]; then
	echo MySQL Roundcube database: ${my_rcdb}
	echo MySQL Roundcube username: ${my_rcuser}
	echo MySQL Roundcube password: ${my_rcpass}
	echo ---------------------------------
fi
echo \! Only set when MySQL was not available
echo MySQL root password: ${my_rootpw}
echo ---------------------------------
echo mailcow administrator
echo Username: ${mailcow_admin_user}
echo Password: ${mailcow_admin_pass}
echo ---------------------------------
echo FQDN: ${sys_hostname}.${sys_domain}
echo Timezone: ${sys_timezone}
echo ---------------------------------
echo Web root: https://${sys_hostname}.${sys_domain}
echo ---------------------------------
echo mailcow version: ${mailcow_version}_${mailing_platform}
echo ---------------------------------

echo
echo "`tput setaf 2`Finished installation`tput sgr0`"
echo
echo "Next steps:"
echo " * Backup the above log to a safe place"
echo " * Login to https://$sys_hostname.$sys_domain (please use the full URL and not your IP address)"
echo "   Username: ${mailcow_admin_user}"
echo "   Password: ${mailcow_admin_pass}"
echo " * Please recheck PTR records in ReverseDNS for both IPv4 and IPv6, also verify you have setup SPF TXT records."
echo " * Please see the wiki for help @ https://github.com/andryyy/mailcow/wiki before opening an issue"
echo