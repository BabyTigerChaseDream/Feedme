
import webparser as wp

#nytimes_url = 'https://www.nytimes.com/section/world'
nytimes_url = 'https://www.nytimes.com/international/section/opinion'

class news():
    def __init__(self, url=nytimes_url):
        self.bs = wp.getPage(url)
    
    def article(self,selector=None):
        # all elements has a href&h2 title embeded
        artblock_list=[a for a in self.bs.select('a') if a.find('h2')]

        # artical title
        title_list = [h.find('h2').text for h in artblock_list]
        # (title, link) of each title
        title_href = [(a.find('h2').text, a['href']) for a in artblock_list]
        # paraph of all articles
        paraph_list = [a.find('p').text for a in  artblock_list]

        # get date of each artile

    def search(self):
        # search keywords in 'search' tab
        pass    
    def getRss(self):
        # https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/asia/rss.xml
# get RSS of all articles

hreflist=bs.select('a')
len(hreflist)
for h in hreflist:
    if h['href'] and '2022' in h['href']:
        print(h['href'])