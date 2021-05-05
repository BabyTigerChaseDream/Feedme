import feedparser
from collections import namedtuple

from .models import Rss, Articles 

import dateutil.parser
import datetime

import re

# TODO : move it back to rss subfolder 

article= namedtuple('article', 
            ['title', 'authors', 'description','link', 'publish_date', 'feedurl'] )

''' supportive functions '''
def html2str(htmlstr):
    htmlstr = re.sub("<.*?>", "", htmlstr)
    htmlstr = htmlstr.translate({c:" " for c in "!@#$%^&*()[]{};:,./<>?\|`~-=_+"}) 
    return htmlstr


'''   Class definition '''

class RSSFeed():
    def __init__(self,url):
        self.url= url
        self.article_list = []

    def get_articles(self, url=None):
        url = url or self.url

        # get articles from rssfeed
        self.feed = feedparser.parse(url)

        # common info of RSSFeed
        article_entries = self.feed['entries']
        feedurl = self.feed['href']

        print('Total articles: {length} \n'.format(length=len(article_entries)))

        for a in article_entries:
            self.article_list.append( 
                article(
                    title=a.get('title',""),
                    authors = a.get('authors',""),
                    description = html2str(a.get('summary',"")),
                    link = a.get('link',""),
                    publish_date = dateutil.parser.parse( 
                        a.get('published', str(datetime.datetime.now()) 
                            )
                        ),
                    feedurl = feedurl 
                )
            )
        #return self.Articles

    def save_one(self, a: article):
        try:
            A= Articles
            A.objects.create(
                title=a.title,
                authors = a.authors,
                description = a.description,
                link = a.link,
                publish_date = a.publish_date,
                feedurl = a.feedurl
                )
        except Exception as e:
                if "Duplicate" in e:
                   pass 
                else:
                    print (" ****> {e}".format(e=e) )              

    def save_all(self):
        A= Articles
        for a in self.article_list:
            try:
                A.objects.create(
                    title=a.title,
                    authors = a.authors,
                    description = a.description,
                    link = a.link,
                    publish_date = a.publish_date,
                    feedurl = a.feedurl
                    )
            except Exception as e:
                if "Duplicate" in e:
                    continue
                else:
                    print (" ****> {e}".format(e=e) )                

