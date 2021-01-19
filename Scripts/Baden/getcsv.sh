#!/bin/bash


echo "school, email, " > finalanswer.txt
let time=$1
./Parseplaceid.py > placeid.txt
sleep 3
for place in $(cat placeid.txt)
do
	./GetSchoolid.py $place $time > schoolid.txt
	((time+=1))
	sleep 3
	for school in $(cat schoolid.txt)
	do
		./Parseschool.py $school $time >> finalanswer.txt
		sleep 3
		((time+=1))
	done
	
done

