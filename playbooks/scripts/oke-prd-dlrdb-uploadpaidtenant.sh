#!/bin/bash
cd /data03/backup/ASHPOKEAD3RDB13/
currentdate=$(date '+%Y-%m-%d')
find . -type f -newermt $currentdate -exec cp -pf {} /data03/backup/tmpfiles/ \;
cd /data03/backup/
tar -zcvf DatabaseBkp.tar.gz tmpfiles/*
/root/.local/bin/oci os object put -ns ocispl150 --profile PAIDPRD -bn OKEPRD_DL_RDBBackup --name DatabaseBkp.tar.gz_`date '+%Y-%m-%d'` --file DatabaseBkp.tar.gz
rm -rf DatabaseBkp.tar.gz
rm -rf /data03/backup/tmpfiles/*

