#!/bin/bash
touch empty.txt
cat empty.txt > finalanswer2.txt
for al in $(cat links.txt)
do
	./getcontent.py $al > aschool.txt
	./parseschool.sh >> finalanswer2.txt
	sleep 4
done

