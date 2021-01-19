#!/bin/bash
touch empty.txt
cat empty.txt > finalanswer3.txt
cat empty.txt > links3.txt
cat finalanswer2.txt | grep -n -v '@' | awk -F\: '{print $1}' > missing.txt
for i in $(cat missing.txt)
do
	cat links2.txt | head -n$i | tail -n1 > currentlink.txt
	cat currentlink.txt >> links3.txt
	wget -O aschool.txt https://schulnetz.nibis.de/db/schulen/$(head -n1 currentlink.txt)
	./parseschool.sh >> finalanswer3.txt
	sleep 12
done
