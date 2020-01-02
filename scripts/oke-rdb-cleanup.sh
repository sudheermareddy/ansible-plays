#!/bin/bash
bn=NPROKE_RDBBackup
/root/.local/bin/oci os object list -bn $bn | jq '.data[].name'| tr -d \" | sed '$d; s/^ *//' > dbfiles.txt
linecount=`wc -l <dbfiles.txt`
#echo $linecount
if [ $linecount -gt 30 ]
then
 filename=`head -1 dbfiles.txt`
 #echo $filename
 /root/.local/bin/oci os object delete -bn $bn --name $filename --force
fi


#for i in $(cat dbfiles.txt); do
    #echo $i
#    /root/.local/bin/oci os object delete -bn $bn --name $i --force
#done
