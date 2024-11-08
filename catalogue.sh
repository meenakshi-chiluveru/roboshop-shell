# loaded sourcefile which is common.sh into cataloge.sh
source common.sh
component=catalogue
nodejs
echo install mongodb client
dnf install mongodb-mongosh -y &>LOG_FILE

echo load master data
mongosh --host mongo.dev.daws80.online </app/db/master-data.js &>LOG_FILE

