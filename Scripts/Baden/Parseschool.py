#!/usr/bin/python
import requests
import sys


def requestschool(uuid,time):
	r = requests.get(
	'https://schulfinder.kultus-bw.de/api/school',
	params = {'uuid' : uuid, '_' : time},
	headers = {
	'Host': "schulfinder.kultus-bw.de",
	'User-Agent': "Mozilla/5.0 (X11; Linux i686; rv:80.0) Gecko/20100101 Firefox/80.0",
	'Accept': "application/json, text/javascript, */*; q=0.01",
	'Accept-Language': "en-CA,en-US;q=0.7,en;q=0.3",
	'Accept-Encoding': "gzip, deflate",
	'X-Requested-With': "XMLHttpRequest",
	'Connection': "close",
	'Referer': "https://schulfinder.kultus-bw.de/",
	})
	#print r.content
	#print r.encoding
	#r.encoding='utf-8'
	#print r.content
	print r.content

#	d = r.json()
	
#	if "name" in d and "email" in d:
#		print d["name"],",", d["email"],","
#		return
#	if "name" in d:
#		print d["name"]
#	if "email" in d:
#		print d["email"]

	
#main
uuid = sys.argv[1]
time = sys.argv[2]
requestschool(uuid, time)


