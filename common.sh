LOG_FILE=/tmp/roboshop
rm -rf $LOG_FILE

PRINT(){
  echo &>>$LOG_FILE
  echo &>>$LOG_FILE
  echo "############# $* ######" echo &>>$LOG_FILE
  echo $*
}
nodejs(){
  PRINT disable nodejs default cersion
  dnf module disable nodejs -y  &>>$LOG_FILE

  PRINT enable nodejs version
  dnf module enable nodejs:20 -y  &>>$LOG_FILE

 PRINT copy service file
  cp ${component}.service /etc/systemd/system/${component}.service  &>>$LOG_FILE

  PRINT copy mongodb repo file
  cp mongo.repo /etc/yum.repos.d/mongo.repo  &>>$LOG_FILE

  PRINT add user
  useradd roboshop  &>>$LOG_FILE

 PRINT remove/cleqnaing app directory
  rm -rf /app  &>>$LOG_FILE

 PRINT make /app directory
  mkdir /app  &>>$LOG_FILE

PRINT download application content
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip  &>>$LOG_FILE

PRINT change to app directory
  cd /app  &>>$LOG_FILE

 PRINT extracting application
  unzip /tmp/${component}.zip  &>>$LOG_FILE

  PRINT change directory to /app
  cd /app  &>>$LOG_FILE

 PRINT download nodejs dependencies
  npm install &>>$LOG_FILE

PRINT start service
  systemctl daemon-reload &>>$LOG_FILE
  systemctl enable ${component} &>>$LOG_FILE
  systemctl restart ${component} &>>$LOG_FILE
}