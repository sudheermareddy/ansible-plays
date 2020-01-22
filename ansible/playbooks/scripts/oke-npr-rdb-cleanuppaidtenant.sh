#!/bin/bash

/root/.local/bin/oci os object list --profile PAIDNPR -bn NPR_RDBBackup | jq '.data[].name'| tr -d \" > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
#echo $linecount
if [ $linecount -gt 7 ]
then
 filename=`head -1 dbfiles.txt`
 /root/.local/bin/oci os object delete --profile PAIDNPR -bn NPR_RDBBackup --name $filename --force
 #echo $filename
fi


/root/.local/bin/oci os object list --profile PAIDNPR -bn PRD_RDBBackup | jq '.data[].name'| tr -d \" > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
##echo $linecount
if [ $linecount -gt 7 ]
then
 filename=`head -1 dbfiles.txt`
 /root/.local/bin/oci os object delete --profile PAIDNPR -bn PRD_RDBBackup --name $filename --force
fi
