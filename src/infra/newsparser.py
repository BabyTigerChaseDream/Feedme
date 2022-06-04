
import webparser as wp
import inspect

nytimes_url = 'https://www.nytimes.com/section/world'
#nytimes_url = 'https://www.nytimes.com/international/section/opinion'
#nytimes_url = 'https://www.nytimes.com/section/world/asia'

class news:
    def __init__(self, url=nytimes_url):
        self.bs = wp.getPage(url)
    
    def get_block(self,selector=None):
        try:
            # all elements has a href&h2 title embeded
            self.artblock_list=[a for a in self.bs.select('a') if a.find('h2')]
        except Exception as e:
            print(inspect.stack()[0][3])

    def get_titles(self,selector=None):
        try:
            # artical title
            self.titles = [h.find('h2').text for h in self.artblock_list]
        except Exception as e:
            print(inspect.stack()[0][3])   
        return self.titles

    def get_hrefs(self,selector=None):
        try:
            # (title, link) of each title
            self.hrefs = [(a.find('h2').text, a['href']) for a in self.artblock_list]
        except Exception as e:
            print(inspect.stack()[0][3])
        return self.hrefs

    def get_paraph(self,selector=None):        
        try:
            # paraph of all articles
            self.paraph= [a.find('p').text for a in  self.artblock_list]
        except Exception as e:
            print(inspect.stack()[0][3])
        return self.paraph

    def search(self):
        # search keywords in 'search' tab
        pass    

    def getRss(self):
        # https://www.nytimes.com/svc/collections/v1/publish/https://www.nytimes.com/section/world/asia/rss.xml
        pass

if __name__ == '__main__':
    t_news = news(url=nytimes_url)
    t_news.get_block()
    t_news.get_titles()
    t_news.get_hrefs()
    t_news.get_paraph()

    print('news : hrefs')
    for n in t_news.hrefs:
        print(n) 