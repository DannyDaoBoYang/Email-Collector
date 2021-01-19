#!/bin/bash

touch empty.txt
cat empty.txt > untrimedlinks.txt
oIFS=$IFS
for afile in $(ls ./search/*)
do
	cat $afile | grep cHash > linksblock.txt # grab only the lines with cHash
	
	IFS='<>'
	while read -r line
	do

		echo $line >> untrimedlinks.txt	

	done < linksblock.txt
	IFS=$oIFS
done

cat empty.txt > links.txt
for chunk in $(cat untrimedlinks.txt)
do
	echo $chunk | grep cHash | awk -F\" '{print $2}' >> links.txt
done 


