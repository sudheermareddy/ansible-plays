#!/bin/bash
cd /data03/backup/ASHPOKEAD3RDB06/
currentdate=$(date '+%Y-%m-%d')
find . -type f -newermt $currentdate -exec cp -pf {} /data03/backup/tmpfiles/ \;
cd /data03/backup/
tar -zcvf DatabaseBkp.tar.gz tmpfiles/*
/usr/local/bin/oci os object put -ns jumpstart -bn OKE_RethinkDB_Backup --name DatabaseBkp_tl.tar.gz_`date '+%Y-%m-%d'` --file DatabaseBkp.tar.gz
rm -rf DatabaseBkp.tar.gz
rm -rf /data03/backup/tmpfiles/*
