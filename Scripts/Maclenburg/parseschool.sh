#!/bin/bash

oIFS=$IFS
IFS='<>'
touch empty.txt
cat empty.txt > tempschool.txt
for line in  $(cat aschool.txt)
do
	echo $line >> tempschool.txt
done 
IFS=$oIFS

#three lines after first /div
#@
#schulleiter

cat tempschool.txt | grep '@' | awk -F\: '{print $2}' | awk -F'"' '{print $1}' > email.txt
cat tempschool.txt | grep 'Schulleiter' | awk -F\: '{print $2}' > person.txt

cat tempschool.txt | grep -n '\/div' | awk -F\: '{print $1}' > nameindex.txt
let linenum=$(head -n1 nameindex.txt)
((linenum=linenum+3))
head -n$linenum tempschool.txt | tail -n1 > schoolname.txt

echo "$(head -n1 schoolname.txt), $(head -n1 person.txt), $(head -n1 email.txt)"

rm email.txt
rm person.txt
rm schoolname.txt
rm nameindex.txt



