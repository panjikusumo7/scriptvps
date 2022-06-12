#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# ==================================================
# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/panjikusumo7/scriptvps/main/ssh"

# Link Hosting Kalian Untuk Xray
akbarvpnn="raw.githubusercontent.com/panjikusumo7/scriptvps/main/xray"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=akbarstorevpn
organizationalunit=akbarstorevpn
commonname=akbarstorevpn
email=akbarssh21@gmail.com

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6


# install fail2ban
apt -y install fail2ban

# Install BBR
wget https://${akbarvpn}/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# download script
cd /usr/bin
wget -O addhost "https://${akbarvpn}/addhost.sh"
wget -O about "https://${akbarvpn}/about.sh"
wget -O menu "https://raw.githubusercontent.com/panjikusumo7/scriptvps/main/update/menu.sh"
wget -O speedtest "https://${akbarvpn}/speedtest_cli.py"
wget -O info "https://${akbarvpn}/info.sh"
wget -O ram "https://${akbarvpn}/ram.sh"
wget -O clearlog "https://${akbarvpn}/clearlog.sh"
wget -O changeport "https://${akbarvpn}/changeport.sh"
wget -O porttrojan "https://${akbarvpn}/porttrojan.sh"
wget -O portvlm "https://${akbarvpn}/portvlm.sh"
wget -O xp "https://${akbarvpn}/xp.sh"
wget -O swapkvm "https://${akbarvpn}/swapkvm.sh"
wget -O addvmess "https://${akbarvpnn}/addv2ray.sh"
wget -O addvless "https://${akbarvpnn}/addvless.sh"
wget -O addtrojan "https://${akbarvpnn}/addtrojan.sh"
wget -O delvmess "https://${akbarvpnn}/delv2ray.sh"
wget -O delvless "https://${akbarvpnn}/delvless.sh"
wget -O deltrojan "https://${akbarvpnn}/deltrojan.sh"
wget -O cekvmess "https://${akbarvpnn}/cekv2ray.sh"
wget -O cekvless "https://${akbarvpnn}/cekvless.sh"
wget -O cektrojan "https://${akbarvpnn}/cektrojan.sh"
wget -O renewvmess "https://${akbarvpnn}/renewv2ray.sh"
wget -O renewvless "https://${akbarvpnn}/renewvless.sh"
wget -O renewtrojan "https://${akbarvpnn}/renewtrojan.sh"
wget -O certv2ray "https://${akbarvpnn}/certv2ray.sh"
wget -O addtrgo "https://${akbarvpnnn}/addtrgo.sh"
wget -O deltrgo "https://${akbarvpnnn}/deltrgo.sh"
wget -O renewtrgo "https://${akbarvpnnn}/renewtrgo.sh"
wget -O cektrgo "https://${akbarvpnnn}/cektrgo.sh"
wget -O vmessmenu "https://raw.githubusercontent.com/panjikusumo7/scriptvps/main/update/vmessmenu.sh"
wget -O vlessmenu "https://raw.githubusercontent.com/panjikusumo7/scriptvps/main/update/vlessmenu.sh"
wget -O trmenu "https://raw.githubusercontent.com/panjikusumo7/scriptvps/main/update/trmenu.sh"
wget -O setmenu "https://raw.githubusercontent.com/panjikusumo7/scriptvps/main/update/setmenu.sh"



chmod +x vmessmenu
chmod +x vlessmenu
chmod +x trmenu
chmod +x setmenu

chmod +x addhost
chmod +x menu

chmod +x speedtest
chmod +x info
chmod +x about
chmod +x ram
chmod +x clearlog
chmod +x changeport
chmod +x porttrojan
chmod +x portvlm
chmod +x xp
chmod +x swapkvm
chmod +x addvmess
chmod +x addvless
chmod +x addtrojan
chmod +x delvmess
chmod +x delvless
chmod +x deltrojan
chmod +x cekvmess
chmod +x cekvless
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
