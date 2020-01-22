str1="nameserver 10.11.34.2"
#str2="nameserver 10.11.33.2"
var=$(cat /etc/resolv.conf | grep  -n "$str1" | cut -d: -f2)
#var=$(cat /etc/resolv.conf | grep  -n "$str2" | cut -d: -f2)
if [ "$var" != "$str1" ] ;then echo "error" ;fi
#if [ "$var" != "$str2" ] ;then echo "error" ;fi
