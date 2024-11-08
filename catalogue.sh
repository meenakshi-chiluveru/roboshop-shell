# loaded sourcefile which is common.sh into cataloge.sh
source common.sh
component=catalogue
nodejs
dnf install mongodb-mongosh -y
mongosh --host mongo.dev.daws80.online </app/db/master-data.js
