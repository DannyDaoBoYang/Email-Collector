#!/bin/bash

touch empty.txt
cat empty.txt > finalanswer.txt
for sub in $(cat links.txt)
do
	wget -O aschool.txt https://schulnetz.nibis.de/db/schulen/$sub
	./parseschool.sh >> finalanswer.txt
	sleep 3
done
