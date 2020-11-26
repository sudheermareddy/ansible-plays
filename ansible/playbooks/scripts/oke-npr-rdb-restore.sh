url=$1
shared=$2
replica=$3
data_path="/data01/var/lib/rethinkdb/data"

#list dbs
recli "r.dbList()" | tr -d ,[]|sed $'s/[^[:print:]\t]//g'| sed 's/32m//g'| sed 's/39m//g'|sed '/'rethinkdb'/d' | tr -dc '[:print:]'|sed 's/\s\+/\n/g'|awk 'NF' > /tmp/dblist
#recli "r.dbList()" | tr -d ,[]' '|sed $'s/[^[:print:]\t]//g'| sed 's/32m//g'| sed 's/39m//g'|sed '/'rethinkdb'/d' > /tmp/dblist

#drop existing dbs
if cat /tmp/dblist | wc -l < 0; then
 while read p
do
recli "r.dbDrop($p)"
done < /tmp/dblist
 fi
#removing old data
#file=($data_path/*.tar.gz*)
# if [ -e "${file[0]}" ]; then
 rm $data_path/*.tar.gz*
 #fi
if [ -d "$data_path/tmpfiles" ]; then
sudo rm -rf $data_path/tmpfiles
fi

#download and un tar the rdb backup files
cd $data_path
wget $url
tar xvf *.tar.gz*
#restoring the rdb databases with shard and repica count.
if [ -d "$data_path/tmpfiles" ]; then
        ls $data_path/tmpfiles > /tmp/bkplist
    cd  $data_path/tmpfiles
while read p
do
echo $p
q=$(echo $p | awk -F '\\_Bak.tar' '{print $1"_Bak.tar"}' | sed 's/_Bak.tar//')
rethinkdb restore $p -i $q --shards $shared --replicas $replica --force
echo "$p db is restored"
done < /tmp/bkplist
fi
rm /tmp/bkplist /tmp/dblist
