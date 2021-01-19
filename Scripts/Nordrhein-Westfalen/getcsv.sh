#!/bin/bash

for afile in $(ls ./search)
do
	touch empty.txt
	cat empty.txt > ./startindex/start$afile
	cat ./search/$afile | grep -n kachelBodySchuleSuchenInnen | awk -F\: '{print $1}' >> ./startindex/start$afile
	for index in $(cat ./startindex/start$afile)
	do
		let tempindex=$index
		((tempindex=tempindex+15))
		cat ./search/$afile | head -n$tempindex | tail -n15 > currentchunk.txt
		cat currentchunk.txt | head -n1 | xargs -0 > schoolname.txt
		cat currentchunk.txt | grep mailto | awk -F\: '{print $2}' | awk -F\' '{print $1}' | head -n1 > email.txt
		echo "$(head -n1 schoolname.txt),$(head -n1 email.txt)"
	done
done
