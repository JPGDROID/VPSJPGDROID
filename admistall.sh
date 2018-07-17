#!/bin/bash
insta_arquivos1="/etc/adm-server"
insta_arquivos2="/etc/adm-server/adm-ultimate"
 
instala_fun () {
echo -e "${cor[2]}OK, key: ${cor[3]}$key_key${cor[2]} Valida! Instalando..."
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠"
soma_install
apt-get install zip -y > /dev/null
apt-get install unzip -y > /dev/null
apt-get install screen -y > /dev/null
apt-get install apache2 -y > /dev/null 2>&1
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart > /dev/null 2>&1
[[ -e "$insta_arquivos1" ]] && rm -rf $insta_arquivos1
mkdir $insta_arquivos1
mkdir $insta_arquivos2
unzip $HOME/server.zip
rm -rf $HOME/server.zip
mv -f $HOME/etc/adm-server/adm-ultimate/* $insta_arquivos2/
rm -rf $HOME/etc
mv -f $insta_arquivos2/autoonline /bin/
mv -f $insta_arquivos2/keyserver.sh /bin/
chmod 777 /bin/*
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠"
echo -e "${cor[2]} Perfeito, Use o Comando \033[1;31mautoonline ${cor[2]}
 para Gerenciar as Suas Keys e
 Atualizar a Base do servidor"
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠\033[0m"
}
 
verify_fun () {
serialx=$(echo $serial|cut -d'+' -f1)
serialy=$(echo $serial|cut -d'+' -f2)
ofuscate_fun "$serialx"
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
request='encapsulate --fd 3 -si4o5 sh -c "cat<&4;echo ${txt}>&5"'
echo -e "txt=$serialy\n$request" > $HOME/tmp && chmod +x $HOME/tmp
dirdown=$(hose ${server} 2000 --fd 3 sh -c "$HOME/tmp" 2> /dev/null)
     rm $HOME/tmp
     [[ $dirdown != "" ]] && {
     echo -e "${cor[2]}Key: ${cor[3]}$serial"
     sleep 5s
     cd $HOME
     wget http://${txt_ofuscatw}/${dirdown}/server.zip -o /dev/null
     [[ -e $HOME/server.zip ]] && return 0
     } || return 1     
}
 
soma_install () {
P_SERVER="104.238.135.147"
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
request='encapsulate --fd 3 -si4o5 sh -c "cat<&4;echo ${txt}>&5"'
echo -e "txt='addserver $IP'\n$request" > $HOME/tmp && chmod +x $HOME/tmp
varserver=$(hose ${P_SERVER} 2000 --fd 3 sh -c "$HOME/tmp" 2> /dev/null) && rm $HOME/tmp
[[ $varserver != "" ]] && echo -e " SERVER ADDED SUCESSFULLY"
}
 
ofuscate_fun () {
unset txtofus
number=$(expr length $1)
for ((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
if [ "${txt[$i]}" = "." ]; then
txt[$i]="#"
elif [ "${txt[$i]}" = "#" ]; then
txt[$i]="."
fi
if [ "${txt[$i]}" = "1" ]; then
txt[$i]="@"
elif [ "${txt[$i]}" = "@" ]; then
txt[$i]="1"
fi
if [ "${txt[$i]}" = "2" ]; then
txt[$i]="?"
elif [ "${txt[$i]}" = "?" ]; then
txt[$i]="2"
fi
if [ "${txt[$i]}" = "3" ]; then
txt[$i]="&"
elif [ "${txt[$i]}" = "&" ]; then
txt[$i]="3"
fi
txtofus+="${txt[$i]}"
done
link_list=$(echo $txtofus|rev)
txt_ofuscatw=$(echo $txtofus|rev)
}
 
rm $(pwd)/$0
apt-get install netpipes -y > /dev/null 2>&1
#===============================#
cor[1]="\033[1;36m"
cor[2]="\033[1;33m"
cor[3]="\033[1;31m"
cor[4]="\033[0m"
#===============================#
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠"
echo -e "${cor[3]} INSTALADOR ADM-SCRIPTS ®"
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠"
echo -e "${cor[3]} Iniciando Instalação..."
echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠"
echo -ne "${cor[4]}"
while true; do
unset serial
echo -ne "Digite Agora Seu Serial!: \033[1;37m"
read serial
[[ -z $serial ]] && echo -e "Serial Nulo" || verify_fun
     [[ $? = "0" ]] && {
     instala_fun
     break
     } || {
     echo -e "${cor[2]}key invalida..."
     echo -e "${cor[1]}=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠=≠\033[0m"
     echo -ne "${cor[2]}Deseja Tentar Outra? [S/N]: "
     read other
              [[ $other = @(s|S|y|Y) ]] && echo -e "${cor[3]}Tentando Nova Key..." || {
              exit 1
              echo -e "\033[0m"
              }
     }
done
exit