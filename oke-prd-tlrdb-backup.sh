#!/bin/bash

sudo rethinkdb dump -e tl_notification -f /data03/backup/ASHPOKEAD3RDB06/tl_notification_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_permissions -f /data03/backup/ASHPOKEAD3RDB06/tl_permissions_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_qloudable_billings -f /data03/backup/ASHPOKEAD3RDB06/tl_qloudable_billings_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_qloudable_trainings -f /data03/backup/ASHPOKEAD3RDB06/tl_qloudable_trainings_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_terminal -f /data03/backup/ASHPOKEAD3RDB06/tl_terminal_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_user_management -f /data03/backup/ASHPOKEAD3RDB06/tl_user_management_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_appstream -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_appstream_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_cleanup_resource -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_cleanup_resource_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_eula -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_eula_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_project -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_project_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_provider -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_provider_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_templates -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_templates_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_training_deployment -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_training_deployment_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_user_training -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_user_training_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_transfers -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_transfers_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_metadata -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_metadata_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e tl_veegam_webhook -f /data03/backup/ASHPOKEAD3RDB06/tl_veegam_webhook_Bak.tar.gz_`date '+%Y-%m-%d'`
find /data03/backup/ASHPOKEAD3RDB06/*Bak.tar* -mtime +7 -exec rm {} \;
