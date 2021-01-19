#!/bin/bash

touch empty.txt
cat empty.txt > finalanswer.txt
for link in $(cat linkS.txt)
do
	./parseschool.sh $link >> finalanswer.txt
	sleep 3
done
