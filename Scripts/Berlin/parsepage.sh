#!/bin/bash

#aschool.txt for testing
#$1 for production

wget -O school.txt $1
#cat aschool.txt > school.txt


#type? $2 
#MySchulName 
#HLinkEMail mail
#lblLeitung" name
#postion  is management

cat school.txt | grep MySchulName | awk -F\> '{print $2}' | awk -F\< '{print $1}' | awk -F\( '{print $1}' | awk -F\ \-\  '{print $1}' > schoolname.txt
cat school.txt | grep HLinkEMail | awk -F\> '{print $2}' | awk -F\< '{print $1}' > mail.txt
cat school.txt | grep 'lblLeitung"' | awk -F\> '{print $2}' | awk -F\< '{print $1}' > name.txt
cat name.txt | awk -F\, '{print $1}' > lastname.txt
cat name.txt | awk -F\,\  '{print $2}' > firstname.txt

echo "$(head -n1 schoolname.txt),$(head -n1 firstname.txt) $(head -n1 lastname.txt),$(head -n1 mail.txt),"



