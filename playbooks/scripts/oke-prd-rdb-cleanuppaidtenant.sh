#!/bin/bash

/root/.local/bin/oci os object list --profile PAIDPRD -bn OKEPRD_RDBBackup | jq '.data[].name'| tr -d \" > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
#echo $linecount
if [ $linecount -gt 7 ]
then
 filename=`head -1 dbfiles.txt`
 /root/.local/bin/oci os object delete --profile PAIDPRD -bn OKEPRD_RDBBackup --name $filename --force
fi

/root/.local/bin/oci os object list --profile PAIDPRD -bn OKEPRD_RDBBackup | jq '.data[].name'| tr -d \" > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
##echo $linecount
if [ $linecount -gt 7 ]
then
 filename=`head -1 dbfiles.txt`
 /root/.local/bin/oci os object delete --profile PAIDPRD -bn OKEPRD_RDBBackup --name $filename --force
fi


