sudo -u hdfs sqoop import \
--connect 'jdbc:sqlserver://10.2.0.62:1433;database='nombrebase' \
--username username \
--password password \
--query "SELECT *  FROM RIPS_CONSULTAS WHERE \$CONDITIONS" \
--hive-import -m 1 \
--hive-table tabla \
--target-dir tabla \
--delete-target-dir \
--hive-overwrite
