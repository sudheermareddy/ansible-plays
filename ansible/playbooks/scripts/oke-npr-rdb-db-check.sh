#!/bin/bash
data_path="/data01/var/lib/rethinkdb/"
recli "r.dbList()" > $data_path/dblist_current
if diff $data_path/dblist $data_path/dblist_current > /dev/null
then
 diff $data_path/dblist $data_path/dblist_current
echo "no changes in DB"
else
echo "Error : DB has below changes"
diff $data_path/dblist $data_path/dblist_current
fi
