#!/bin/bash

for line in $(cat listwish.txt)
do
	cat './original/'"$line.txt" | grep HLinkSchulNr > './links/'"$line.txt"
	cut -d "\"" -f 4 './links/'"$line.txt" > './trimed/'"$line.txt"
	cut -d " " -f 2 './trimed/'"$line.txt" > './id/'"$line.txt"
	echo "1,2,3,4,5,6,7,8,9,10," > './results/'"$line.txt"
	for school in $(cat './id/'"$line.txt")
	do
		./parsepage.sh https://www.berlin.de/sen/bildung/schule/berliner-schulen/schulverzeichnis/Schulportrait.aspx?IDSchulzweig=%20$school >> './results/'"$line.txt"
		sleep 3
	done
done
