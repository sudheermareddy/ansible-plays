#!/bin/bash
bn=OKE_RethinkDB_Backup
/root/.local/bin/oci os object list -bn $bn | jq '.data[].name'| tr -d \" | sed '$d; s/^ *//' > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
if [ $linecount -gt 30 ]
then
 filename=`head -1 dbfiles.txt`
 /root/.local/bin/oci os object delete -bn $bn --name $filename --force
fi
