#!/bin/bash

#break by { and ,
# get pieces with gid
#awk -F\" print $4
#restore IFS

oIFS=$IFS

touch empty.txt
cat empty.txt > links.txt
for itn in $(ls ./searchpage/*)
do
	touch empty.txt
	cat empty.txt > templinks.txt
	IFS='{,'
	while read -r line
	do
		echo $line | grep gid >> templinks.txt
	done < $itn
	IFS=$oIFS

	for seg in $(cat templinks.txt)
	do
		echo $seg | grep gid | awk -F\" '{print $4}' >> links.txt
	done
	
done

