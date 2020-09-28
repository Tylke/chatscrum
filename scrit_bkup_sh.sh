#!/bin/bash
MYSQL_PASSWORD="password"
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/root"
DB=wordpress
mysqldump -u root -ppassword wordpress > wordpress.sql
stat -c %s "/root/wordpress.sql"
find $BACKUP_DIR/* -mtime +5 -exec rm {} \;