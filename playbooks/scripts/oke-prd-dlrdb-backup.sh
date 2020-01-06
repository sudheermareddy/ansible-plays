#!/bin/bash
sudo find /data03/backup/ASHPOKEAD3RDB13/*Bak.tar* -mtime +7 -exec rm {} \;
sudo rethinkdb dump -e NotificationServiceDB -f /data03/backup/ASHPOKEAD3RDB13/NotificationServiceDB_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e dl_veegam_agreement -f /data03/backup/ASHPOKEAD3RDB13/dl_veegam_agreement_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_notification_service -f /data03/backup/ASHPOKEAD3RDB13/qd_notification_service_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_demolabs -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_demolabs_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_deployment -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_deployment_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_eula -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_eula_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_journey -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_journey_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_metadata -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_metadata_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_permissions -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_permissions_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_project -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_project_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_provider -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_provider_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_stacks -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_stacks_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_templates -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_templates_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e qd_veegam_usermanagement_stacks -f /data03/backup/ASHPOKEAD3RDB13/qd_veegam_usermanagement_stacks_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_billings -f /data03/backup/ASHPOKEAD3RDB13/veegam_billings_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_demolabs -f /data03/backup/ASHPOKEAD3RDB13/veegam_demolabs_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_deployment -f /data03/backup/ASHPOKEAD3RDB13/veegam_deployment_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_eula -f /data03/backup/ASHPOKEAD3RDB13/veegam_eula_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_journey -f /data03/backup/ASHPOKEAD3RDB13/veegam_journey_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_permissions -f /data03/backup/ASHPOKEAD3RDB13/veegam_permissions_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_project -f /data03/backup/ASHPOKEAD3RDB13/veegam_project_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_provider -f /data03/backup/ASHPOKEAD3RDB13/veegam_provider_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_stacks -f /data03/backup/ASHPOKEAD3RDB13/veegam_stacks_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_transfers -f /data03/backup/ASHPOKEAD3RDB13/veegam_transfers_Bak.tar.gz_`date '+%Y-%m-%d'`
sudo rethinkdb dump -e veegam_usermanagement_stacks -f /data03/backup/ASHPOKEAD3RDB13/veegam_usermanagement_stacks_Bak.tar.gz_`date '+%Y-%m-%d'`

sudo find /data03/backup/ASHPOKEAD3RDB13/*Bak.tar* -mtime +7 -exec rm {} \;

