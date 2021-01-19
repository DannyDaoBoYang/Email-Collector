#!/bin/bash

touch empty.txt
cat empty.txt > links.txt
cat search.txt | grep 'schule.php?schulnr=' | awk -F\" '{print $2}'  > doublelinks.txt
sort doublelinks.txt | uniq > links.txt
