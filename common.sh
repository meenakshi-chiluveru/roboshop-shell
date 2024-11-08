LOG_FILE=/tmp/roboshop
rm -rf $LOG_FILE
nodejs(){
  echo disable nodejs default cersion
  dnf module disable nodejs -y  &>>$LOG_FILE

  echo enable nodejs version
  dnf module enable nodejs:20 -y  &>>$LOG_FILE

  echo copy service file
  cp ${component}.service /etc/systemd/system/${component}.service  &>>$LOG_FILE

  echo copy mongodb repo file
  cp mongo.repo /etc/yum.repos.d/mongo.repo  &>>$LOG_FILE

  echo add user
  useradd roboshop  &>>$LOG_FILE

  echo remove/cleqnaing app directory
  rm -rf /app  &>>$LOG_FILE

  echo make /app directory
  mkdir /app  &>>$LOG_FILE

  echo download application content
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip  &>>$LOG_FILE

  echo change to app directory
  cd /app  &>>$LOG_FILE

  echo extracting application
  unzip /tmp/${component}.zip  &>>$LOG_FILE

  echo change directory to /app
  cd /app  &>>$LOG_FILE

  echo download nodejs dependencies
  npm install &>>$LOG_FILE

  echo start service
  systemctl daemon-reload &>>$LOG_FILE
  systemctl enable ${component} &>>$LOG_FILE
  systemctl restart ${component} &>>$LOG_FILE
}