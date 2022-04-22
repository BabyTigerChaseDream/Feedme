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

# scroll and scrape pages
import time
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

nytimes_url = 'https://www.nytimes.com/section/world'

'''

os.environ['CHROMEDRIVER'] = '/home/jia/.wdm/drivers/chromedriver/linux64/99.0.4844.51'
s=Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=s)
driver.get(nytimes_url)

ScrollNumber = 50
for i in range(1,ScrollNumber):
    driver.execute_script("window.scrollTo(1,50)")
    time.sleep(5)

'''
# get html
def getPage(url):
	try:
		req = requests.get(url)
	except requests.exceptions.RequestException:
		return None
	return BeautifulSoup(req.text, 'html.parser')

def getPageText(htmlfile):
	''' curl.sh scrape webpage : article is diff from webpage scraper'''
	with open(htmlfile) as fd:
		htmltext = fd.read()
	#return BeautifulSoup(htmltext, 'html.parser')
	return BeautifulSoup(htmltext)
