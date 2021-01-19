#!/usr/bin/python
import requests
import sys

def getschoolid(placeid):
	r = requests.post(
	'https://www.laiv-mv.de/gaialight3/_apps/schulstandorte/_ajax/_gaia_shortquery.php',
	headers = {
	'Host': 'www.laiv-mv.de',
	'User-Agent': 'Mozilla/5.0 (X11; Linux i686; rv:80.0) Gecko/20100101 Firefox/80.0',
	'Accept': 'text/html, */*; q=0.01',
	'Accept-Language': 'en-CA,en-US;q=0.7,en;q=0.3',
	'Accept-Encoding': 'gzip, deflate',
	'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
	'X-Requested-With': 'XMLHttpRequest',
	'Content-Length': '23',
	'Origin': 'https://www.laiv-mv.de',
	'Connection': 'close',
	'Referer': 'https://www.laiv-mv.de/Statistik/Zahlen-und-Fakten/Gesellschaft-&-Staat/Bildung-und-Kultur/Schulstandorte/',
	'Cookie': 'sz_track=yes; cookieconsent_dismissed=yes; nmstat=1600270411613'
	},
	data = {
		'dataset':'ids',
		'value':placeid
	})
	print r.content
	#arr = r.json()
	#for i in range (0, len(arr)):
	#	print arr[i]["uuid"]
	
#main
placeid = sys.argv[1]
getschoolid(placeid)


