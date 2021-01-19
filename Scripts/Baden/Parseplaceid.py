#!/usr/bin/python
import requests
import sys

def requestlistuid():
	r = requests.get(
	'https://schulfinder.kultus-bw.de/api/admin_units/7',
	params = {'query' :"",'wildcard' : "true"},
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
	d= r.json()
	arrid = d["results"]
	for i in arrid:
		print i["value"]

	
	
#main
requestlistuid()
#await asyncio.sleep(5)

