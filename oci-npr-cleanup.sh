#!/bin/bash
bn=NPRRethinkDBBackup
/root/.local/bin/oci os object list -bn $bn  -ns jumpstart  --profile JMPNPR | jq '.data[].name'| tr -d \" | sed '$d; s/^ *//' > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
#echo $linecount
if [ $linecount -gt 30 ]
then
 filename=`head -1 dbfiles.txt`
 #echo $filename
 /root/.local/bin/oci os object delete -bn $bn -ns jumpstart  --profile JMPNPR --name $filename --force
fi

#for i in $(cat dbfiles.txt); do
#/root/.local/bin/oci os object delete -bn $bn -ns jumpstart  --profile JMPNPR --name $i --force
#done
