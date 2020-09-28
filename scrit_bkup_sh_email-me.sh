#!/bin/bash
FILE=/root/wordpress.sql
MAILADDR="vincetylke@gmail.com"
FROM_ADDRESS="centos"
SUBJECT="Backup exceeded 50K"
BODY="WordPress backup exceeded 50K"
MYSQL_PASSWORD="password"
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/root"
DB=wordpress
mysqldump -u root -ppassword wordpress > wordpress.sql
var1=50000
var2=$(stat -c %s "/root/wordpress.sql")
if [ $var2 -gt $var1 ]
    then
        echo ${BODY} | mail -s ${SUBJECT} ${MAILADDRESS} -- -r ${FROM_ADDRESS}
        echo "WordPress backup exceeded 50K"
fi
