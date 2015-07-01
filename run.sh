#!/bin/bash

echo "installing" > /var/log/container_status

bash /tmp/init/init.sh 2>&1 >> /var/log/startup.log

bash /startup.sh 2>&1 >> /var/log/startup.log

echo "complete" > /var/log/container_status

/usr/bin/supervisord
