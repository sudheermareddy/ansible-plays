#!/bin/bash
STORAGE_ACCOUNT="tlnprreports"
SASTOKEN="sv=2018-03-28&ss=bfqt&srt=sco&sp=rwdlacup&se=2025-09-17T06:11:42Z&st=2019-09-09T22:11:42Z&spr=https,http&sig=MEuIOdVgQ0nutZtQDsnHH%2BOeGAbq7BEACS3aa9JE%2FBI%3D"
#STORAGE_ACCOUNT="tlprodreports"
#SASTOKEN="sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2030-12-31T08:18:51Z&st=2019-11-19T00:18:51Z&spr=https,http&sig=iP0OuY3OXzzRNWH7cwJt7RX6HzdRhCgVugrTSQcwp4g%3D"
CONTAINER_NAME="tl-reports/lab-agreement"

HOST="rdbokenprtl"
#HOST="rdbprtl"
PORT="28015"
DB_NAME="tl_qloudable_trainings"
TABLE_NAME="lab_agreements"

#FUNCTION_URL="https://tl-prod-reports.azurewebsites.net/api/userTrainingData?code=iWqQHBR7fPO0rH0ZtC4iMlmql7z7RMyp1mgtmggeoam/kUDG/DtQow=="
if [ -n "$STORAGE_ACCOUNT" ] && [ -n "$TABLE_NAME" ] && [ -n "$DB_NAME" ] && [ -n "$CONTAINER_NAME" ] && [ -n "$SASTOKEN" ]
then
        fileNameExt=`date +%Y_%m_%d_%H_%M_%S`
        fileName=$TABLE_NAME"_"$fileNameExt".json"
        echo "Export for data started"
        /usr/local/bin/recli -h $HOST -p $PORT --json "r.db('$DB_NAME').table('$TABLE_NAME').map( function(row) { return row.merge({'channelId':'public'}).without('channels');}).map(function(row){return row.merge({'updatedDTS' : row('updatedDTS').toISO8601().slice(0,-6), 'createdDTS' : row('createdDTS').toISO8601().slice(0,-6)})})" > "public_$fileName"
      
        /usr/local/bin/recli -h $HOST -p $PORT --json "r.db('$DB_NAME').table('$TABLE_NAME').concatMap( function(row) { return row('channels');}).map(function(row){return row.merge({'updatedDTS' : row('updatedDTS').toISO8601().slice(0,-6), 'createdDTS' : row('createdDTS').toISO8601().slice(0,-6)})})" > "private_$fileName"
        echo "Export finished and Upload to container started"
        
        curl -X PUT -T "public_$fileName" -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/"public_$fileName"?$SASTOKEN"
        curl -X PUT -T "private_$fileName" -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/"private_$fileName"?$SASTOKEN"
        echo "Upload finished"
else
        echo -e "required ENV variables not set.\n\n required variables: \n\tSTORAGE_ACCOUNT\n\tTABLE_NAME\n\tDB_NAME\n\tCONTAINER_NAME\n\tSASTOKEN"
fi
