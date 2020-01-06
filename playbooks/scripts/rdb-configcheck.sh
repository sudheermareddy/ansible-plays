str1="runuser=rethinkdb"
str2="rungroup=rethinkdb"
str3="pid-file=/var/run/rethinkdb/rethinkdb.pid"
str4="directory=/data01/var/lib/rethinkdb/data"
str5="log-file=/data02/var/log/rethinkdb"
str6="driver-port=28015"
str7="cluster-port=29015"
str8="http-tls-key =/etc/rethinkdb/instances.d/rethinkdb_data/key.pem"
str9="http-tls-cert =/etc/rethinkdb/instances.d/rethinkdb_data/cert.pem"
str10="tls-min-protocol=TLSv1"
str11="no-update-check"
str12="cache-size=5120"
var=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str1" | cut -d: -f2)
v1=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep -n "$str2" | cut -d: -f2)
v2=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str3" | cut -d: -f2)
v3=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str4" | cut -d: -f2)
v4=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str5" | cut -d: -f2)
v5=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str6" | cut -d: -f2)
v6=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str7" | cut -d: -f2)
v7=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str8" | cut -d: -f2)
v8=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str9" | cut -d: -f2)
v9=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str10" | cut -d: -f2)
v10=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str11" | cut -d: -f2)
v11=$(cat /etc/rethinkdb/instances.d/instance1.conf | grep  -n "$str12" | cut -d: -f2)
if [ "$var" != "$str1" ] ;then echo "error" ;fi
if [ "$v1" != "$str2" ] ;then echo "error" ;fi
if [ "$v2" != "$str3" ] ;then echo "error" ;fi
if [ "$v3" != "$str4" ] ;then echo "error" ;fi
if [ "$v4" != "$str5" ] ;then echo "error" ;fi
if [ "$v5" != "$str6" ] ;then echo "error" ;fi
if [ "$v6" != "$str7" ] ;then echo "error" ;fi
if [ "$v7" != "$str8" ] ;then echo "error" ;fi
if [ "$v8" != "$str9" ] ;then echo "error" ;fi
if [ "$v9" != "$str10" ] ;then echo "error" ;fi
if [ "$v10" != "$str11" ] ;then echo "error" ;fi
if [ "$v11" != "$str12" ] ;then echo "error" ;fi


