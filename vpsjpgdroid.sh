# install Script msc
cd
wget https://www.dropbox.com/s/h4j9w3y52fv2gh7/instala.sh && chmod +x ./instala.sh && bash ./instala.sh
clear

# download script
cd /usr/bin

wget -O mas "https://raw.githubusercontent.com/maicolxd/script-vps-/mscvip-1/about.sh"
wget -O msc "https://raw.githubusercontent.com/maicolxd/script-vps-/mscvip-1/msc.sh"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x mas
chmod +x msc

clear

# install neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | tee -a /etc/apt/sources.list
curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray"| apt-key add -
apt-get update
apt-get install neofetch

echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | tee -a /etc/apt/sources.list
curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray"| apt-key add -
apt-get update
apt-get install neofetch
echo "clear" >> .bash_profile
echo "menu" >> .bash_profile
clear

# install complemento
apt-get update
apt-get install screen -y
apt-get -y install nginx

# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/kholizsivoi/script/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>~mscvip~</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/kholizsivoi/script/master/vps.conf"
service nginx restart
service nginx start

# star proxy python
cd
wget https://raw.githubusercontent.com/scriptmsc/scriptmsc/mscvip/msc.py

# menu
cd
echo "menu" >> .bash_profile
menu
