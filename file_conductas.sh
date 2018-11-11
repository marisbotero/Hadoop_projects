sudo -u hdfs hive -f Lista_Conductas.hql > /ruta
hadoop fs -copyToLocal //ruta
vim +"set nobomb | set fenc=utf8 | x" /ruta
Fecha="$(date '+%d/%m/%Y')"
Max_Fecha=$(hive -e "set hive.cli.print.header=false; SELECT TO_DATE(MAX(fecha_hecho))Fecha FROM seguridad.ft_sisc;")
IFS=$'\n'
for conducta in $(cat conductas.csv) ;
do 
	hive -f conductas.hql -hivevar conducta="${conducta}"
	hive -e 'set hive.cli.print.header=true; select * from seguridad.Seguridad' | sed 's/[\t]/;/g' > /ruta/"${conducta}".csv 
	vim +"set bomb | set fenc=utf8 | x" "${conducta}".csv
	sudo -u hdfs cat "/home/script/Seguridad/"${conducta}".csv" |sudo -u hdfs hdfs dfs -moveFromLocal -f - "ruta/"${conducta}".csv"
	rm /ruta/"${conducta}".csv
	Temporal_=$(awk -F ';+' ' {if ($1=="'${conducta}'") print $6}' metadata.csv)
	Temporal=$(echo ${Temporal_:0:21}$Max_Fecha"T00:00:00Z")
	awk -F ';' -v OFS=';' '{ if ($1=="'${conducta}'"){ $14="'$Fecha'"; $15="'$Fecha'"; $6="'$Temporal'"}; print}' metadata.csv > /ruta
	cp -f /ruta

done
hive -e 'drop  table'
rm /ruta
vim +"set bomb | set fenc=utf8 | x" /ruta
sudo -u hdfs hadoop fs -copyFromLocal -f /ruta
rm /ruta
