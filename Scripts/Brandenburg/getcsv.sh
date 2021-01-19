#!/bin/bash

cat empty.txt > finalanswer.csv
for sub in $(cat finalurl.txt)
do
	./parseschool.sh https://bildung-brandenburg.de/schulportraets/$sub >> finalanswer.csv
	sleep 3
done

