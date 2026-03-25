#!/bin/bash





echo "          _______  _______  _______  _______  _______ 
|\     /|(  ___  )(  ____ \(       )(  ___  )(  ____ )
| )   ( || (   ) || (    \/| () () || (   ) || (    )|
| | _ | || (___) || (__    | || || || (___) || (____)|
| |( )| ||  ___  ||  __)   | |(_)| ||  ___  ||  _____)
| || || || (   ) || (      | |   | || (   ) || (      
| () () || )   ( || )      | )   ( || )   ( || )      
(_______)|/     \||/       |/     \||/     \||/       
                                                      
                 By: Jônatas Nunes"
echo
echo




if [ -z "$1" ]; then
	echo "Uso:"
	echo "./resolver domínio.com"
	echo "./resolver -l lista.txt"
	exit
fi

analisar(){

ip=$1

conver=$(host "$ip" | awk '/has address/ {print $4; exit}')

echo -e "O site \033[1;31m$ip\033[0m tem o endereço ip \033[1;31m$conver\033[0m"

linha=$(printf '%0.s--' {1..30})
echo "$linha"
echo "    		     🔍 Analisando IP"
echo "$linha"

sleep 2

org=$(whois "$conver")
if echo "$org" | grep -iq "cloudflare"; then
	echo -e "\033[1;34m[+] WAF detectado: Cloudflare\033[0m"

elif echo "$org" | grep -iq "akamai"; then
	echo -e "\033[1;34m[+] WAF detectado: Akamai\033[0m"

elif echo "$org" | grep -iq "imperva"; then
	echo -e "\033[1;34m[+] WAF detectado: Imperva\033[0m"

elif echo "$org" | grep -iq "fastly"; then
	echo -e "\033[1;34m[+] WAF detectado: Fastly\033[0m"

elif echo "$org" | grep -iq "amazon"; then
	echo -e "\033[1;34m[+] WAF detectado: AWS\033[0m"

elif echo "$org" | grep -iq "sucuri"; then
	echo -e "\033[1;34m[+] WAF detectado: Sucuri\033[0m"

elif echo "$org" | grep -iq "stackpath"; then
	echo -e "\033[1;34m[+] WAF detectado: Stackpath\033[0m"

else
	echo -e "\033[1;31m[-] WAF não detectado\033[0m"
fi

echo
}

if [ "$1" == -l ]; then

arquivo=$2

while read dominio; do
	analisar "$dominio"
done < "$arquivo"

else

analisar "$1"

fi
