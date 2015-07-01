<?php
##
## database access settings in php format
## automatically generated from /etc/dbconfig-common/phpmyadmin.conf
## by /usr/sbin/dbconfig-generate-include
## Wed, 01 Jul 2015 08:53:23 +0000
##
## by default this file is managed via ucf, so you shouldn't have to
## worry about manual changes being silently discarded.  *however*,
## you'll probably also want to edit the configuration file mentioned
## above too.
##
$dbuser='phpmyadmin';
$dbpass='ABw8QFYngvPU';
$basepath='';
$dbname=getenv("MOCLOUD_DATABASE_NAME");
$dbserver=getenv("MOCLOUD_DATABASE_ADDRESS");
$dbport=getenv("MOCLOUD_DATABASE_PORT");
$dbtype='mysql';
