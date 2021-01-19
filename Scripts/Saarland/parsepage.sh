#!/bin/bash
touch empty.txt
cat empty.txt > rawname.txt
cat empty.txt > rawname.txt
cat empty.txt > finalanswer.txt
for file in $(ls ./AllSearchPages/*/*)
do
	cat $file | grep -n '<h3 class="withHeader c-searchresult-teaser__headline">' | awk -F\: '{print $1}' > startschool.txt
	for lines in $(cat startschool.txt)
	do
		let lnum=$lines
		((lnum=$lnum+30))

		let scnum=$lines
		((scnum=$scnum+1))
		cat $file | head -n$lnum | tail -n31 > rawschool.txt 
		cat $file | head -n$scnum | tail -n1 > schoolname.txt 

		cat rawschool.txt | grep 'E-Mail senden an:' | awk -F\" '{print $2}' > email.txt

		cat rawschool.txt | grep -n 'Schulleitung:' | awk -F\: '{print $1}' > rawperson.txt

		if [ "$(wc -c rawperson.txt | awk '{print $1}')" = "1" ]
		then
			cat empty.txt > personname.txt
		else
			let rpn=$(head -n1 rawperson.txt)
			((rpn=$rpn+1))
			cat rawschool.txt | head -n$rpn | tail -n1 | awk -F\> '{print $2}' | awk -F\< '{print $1}' > personname.txt
		fi
		echo "$(head -n1 schoolname.txt),$(head -n1 personname.txt),$(head -n1 email.txt)"'<br>' >> finalanswer.txt 
		cat empty.txt > schoolname.txt
		cat empty.txt > personname.txt
		cat empty.txt > email.txt
	done
done
