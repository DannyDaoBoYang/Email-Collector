#!/bin/bash

wget -O './parseschool/'school.txt $1
cat './parseschool/'school.txt | grep "E-Mail" > './parseschool/'emailblock.txt
cat './parseschool/'school.txt | grep "Schulleiter" > './parseschool/'headblock.txt
cat './parseschool/'school.txt | grep "<h1>" > './parseschool/'Schoolnameblock.txt

OLDIFS=$IFS
IFS='<>'

#email
touch './parseschool/'empty.txt
cat './parseschool/'empty.txt > './parseschool/'emailchunk.txt
while read -r line 
do
	echo $line > './parseschool/'emailchunk.txt
done < './parseschool/'emailblock.txt


#conclusive
#email
IFS=$OLDIFS
touch './parseschool/'empty.txt
cat './parseschool/'empty.txt > './parseschool/'email.txt
for chunk in $(cat './parseschool/'emailchunk.txt)
do
	echo $chunk | grep \|at\| >> './parseschool/'email.txt
done 

#headmaster
cat './parseschool/'headblock.txt | awk -F"Schulleiter" '{print $2}' | awk -F\< '{print $3}' | awk -F\> '{print $2}' > './parseschool/'head.txt

#school name
cat './parseschool/'Schoolnameblock.txt | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F\ \- '{print $1}' > './parseschool/'schoolname.txt

echo "$(head -n1 './parseschool/'schoolname.txt),$(head -n1 './parseschool/'head.txt),$(head -n1 './parseschool/'email.txt),"

#must contain |at| 

#rm block.txt
#rm emailchunk.txt


