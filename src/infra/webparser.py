'''
information source
- blog(RSS)
- news(RSS)
- facebook (Sisy)
- twitter
- medium(RSS) (https://medium.com/feed/@_michaellin)
- google search
'''
import requests
from bs4 import BeautifulSoup

# get html
def getPage(url):
	try:
		req = requests.get(url)
	except requests.exceptions.RequestException:
		return None
	return BeautifulSoup(req.text, 'html.parser')

