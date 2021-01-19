#!/bin/bash
echo "city, name, emial," > finalanswer.txt
while IFS= read -r line; do
	echo $line | awk -F\"city\"\:\" '{print $2}' | awk -F\"\, '{print $1}' | tr \, - > city.txt
	echo $line | awk -F\"name\"\:\" '{print $2}' | awk -F\"\, '{print $1}' | tr \, - > name.txt
	echo $line | awk -F\"email\"\:\" '{print $2}' | awk -F\"\, '{print $1}' | tr \, - > email.txt
	echo "$(head -n1 city.txt),$(head -n1 name.txt),$(head -n1 email.txt)," >> finalanswer.txt 
done < haveboth.txt

uniq -u finalanswer.txt > result.txt
