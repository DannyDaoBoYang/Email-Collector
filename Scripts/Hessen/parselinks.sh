#!/bin/bash

cat rawsearch.txt | grep '<a href="https://schul-db.bildung.hessen.de/schul_db.html/details/?school_no=' | awk -F\" '{print $2}' > linkS.txt

