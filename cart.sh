source common.sh
cp cart.service /etc/systemd/system/cart.service
nodejs
useradd roboshop
rm -rf /App
/mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip
cd /app
npm install
systemctl daemon-reload
systemctl enable cart
systemctl restart cart