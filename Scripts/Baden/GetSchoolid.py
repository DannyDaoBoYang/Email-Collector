#!/usr/bin/python
import requests
import sys

def getschoolid(placeid, time):
	r = requests.get(
	'https://schulfinder.kultus-bw.de/api/schools',
	params = {'branches':"",
	'city[]':placeid,
	'distance':"",
	'district':"",
	'outposts':"1",
	'owner':"",
	'school_kind':"",
	'term':"",
	'trades':"",
	'types':"21,12,16",
	'work_schedule':"",
	'tablet_tranche':"",
	'_':time},
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
	arr = r.json()
	for i in range (0, len(arr)):
		print arr[i]["uuid"]
	
#main
placeid = sys.argv[1]
time = sys.argv[2]
getschoolid(placeid, time)


