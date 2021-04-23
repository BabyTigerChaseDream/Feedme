import feedparser
from collections import namedtuple

Artical = namedtuple('Artical', 
            ['title', 'retrieve_date', 'authors', 'description','link', 'publish_date', 'href'] )

class RSSFeed():
    def __init__(self,url):
        self.url= url
        self.Articals = []

    def get_articals(self, url=None):
        url = url or self.url

        # get articals from rssfeed
        feed = feedparser.parse(url)

        # common info of RSSFeed
        artical_entries = feed['entries']
        href = feed['href']

        print('Total articals: {length} \n'.format(length=len(artical_entries)))

        for a in artical_entries:
            artical = Artical(
                title=a.get('title',""),
                retrieve_date = 'today',
                authors = a.get('authors',""),
                description = a.get('summary',""),
                link = a.get('link',""),
                publish_date = a.get('published',""),
                href = href 

                )

            self.Articals.append(artical)
    






