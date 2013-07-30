#!/bin/bash
IP_PROD_DB="10.1.49.203"
IP_BACK_DB="10.1.49.206"
DB_NAME="desk_coll"
for table in `mysql -h${IP_PROD_DB} -uroot -ppassword -Bse "use ${DB_NAME}; show tables"`;
do
echo "record $table =" \
$(mysql -h${IP_PROD_DB} -uroot -ppassword -Bse "select count(*) from ${DB_NAME}.$table") \
"," \
$(mysql -h${IP_BACK_DB} -uroot -ppassword -Bse "select count(*) from ${DB_NAME}.$table");
done
