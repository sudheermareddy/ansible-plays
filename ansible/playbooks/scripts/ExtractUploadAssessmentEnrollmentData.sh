#!/bin/bash
STORAGE_ACCOUNT="tlnprreports"
SASTOKEN="sv=2018-03-28&ss=bfqt&srt=sco&sp=rwdlacup&se=2025-09-17T06:11:42Z&st=2019-09-09T22:11:42Z&spr=https,http&sig=MEuIOdVgQ0nutZtQDsnHH%2BOeGAbq7BEACS3aa9JE%2FBI%3D"
# STORAGE_ACCOUNT="tlprodreports"
# SASTOKEN="sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2030-12-31T08:18:51Z&st=2019-11-19T00:18:51Z&spr=https,http&sig=iP0OuY3OXzzRNWH7cwJt7RX6HzdRhCgVugrTSQcwp4g%3D"
CONTAINER_NAME="tl-reports/assessment-enrollment"

HOST="rdbokenprtl"
# HOST="ASHPOKEAD3RDB06"
PORT="28015"
DB_NAME="tl_qloudable_assessment"
TABLE_NAME="enrollments"

if [ -n "$STORAGE_ACCOUNT" ] && [ -n "$TABLE_NAME" ] && [ -n "$DB_NAME" ] && [ -n "$CONTAINER_NAME" ] && [ -n "$SASTOKEN" ]
then
        fileNameExt=`date +%Y_%m_%d_%H_%M_%S`
        fileName=$TABLE_NAME"_"$fileNameExt".json"
        TIME_TYPE="mins"
        TIME_DIFFERENCE=240
        if [ $1 ]
        then
                TIME_DIFFERENCE=$1
        fi
        CURRENT_DATE=`date +%Y,%-m,%-d,%-H,%-M,%-S`
        PREVIOUS_DATE=`date --date "$TIME_DIFFERENCE $TIME_TYPE ago" +%Y,%-m,%-d,%-H,%-M,%-S`
        echo "Export for data started"
        echo "r.db('$DB_NAME').table('$TABLE_NAME').filter(r.row('createdAt').during(r.time($PREVIOUS_DATE,'Z'), r.time($CURRENT_DATE,'Z')))"
        /usr/local/bin/recli -h $HOST -p $PORT --json "r.db('$DB_NAME').table('$TABLE_NAME').filter(r.row('updatedDTS').during(r.time($PREVIOUS_DATE,'Z'), r.time($CURRENT_DATE,'Z'))).merge(function (doc){ return{ 'city' : doc('userGeoip')('city_name').default('N/A'), 'country' : doc('userGeoip')('country_name').default('N/A')}}).map(function(row){return row.merge({'createdAt' : row('createdAt').toISO8601().slice(0,-6), 'updatedDTS' : row('updatedDTS').toISO8601().slice(0,-6)})})" > $fileName
        echo "Export finished and Upload to container started"
        curl -X PUT -T $fileName -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/$fileName?$SASTOKEN"
        echo "Upload finished"
else
        echo -e "required ENV variables not set.\n\n required variables: \n\tSTORAGE_ACCOUNT\n\tTABLE_NAME\n\tDB_NAME\n\tCONTAINER_NAME\n\tSASTOKEN"
fi
