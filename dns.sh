#!/bin/bash
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
SCPfrm="/etc/ger-frm" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" && [[ ! -d ${SCPinst} ]] && exit
dnsnetflix () {
echo "nameserver $dnsp" > /etc/resolv.conf
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf
/etc/init.d/ssrmu stop &>/dev/null
/etc/init.d/ssrmu start &>/dev/null
/etc/init.d/shadowsocks-r stop &>/dev/null
/etc/init.d/shadowsocks-r start &>/dev/null
msg -bar2
echo -e "${cor[4]}  DNS AGREGADOS CON EXITO"
} 
clear
msg -bar2
echo -e "\033[1;93m     DNS PERSONAL  "
msg -bar2
echo -e "\033[1;39m Agrega dns para poder ver Netflix en la VPS"
msg -bar2
echo -e "\033[1;91m ¡ Antes Crea tu Servidor Dns para Netflix!"
echo -e "\033[1;39m En APPS como HTTP Inyector,KPN Rev,APKCUSTOM, etc."
echo -e "\033[1;39m Se deveran agregar manualmente los DNS."
echo -e "\033[1;39m En APPS como SS,SSR,V2RAY no es necesario agregarlos."
msg -bar2
echo -e "\033[1;93m Recuerde compiar bien tu DNS \n segun se hala Creado."
echo ""
echo -e "\033[1;97m Ingrese tu DNS: \033[0;91m"; read -p "   "  dnsp
echo ""
msg -bar2
read -p " Estas seguro de continuar?  [ s | n ]: " dnsnetflix   
[[ "$dnsnetflix" = "s" || "$dnsnetflix" = "S" ]] && dnsnetflix
msg -bar2