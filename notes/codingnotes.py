>>> import feedparser
>>> verge_feed=feedparser.parse('https://www.theverge.com/rss/full.xml')
>>> for i in verge_feed.items():
...     print("\n\n ------------------------- \n\n")
...     print(i)
...  ------------------------- 

('feed', {'language': 'en', 'title': 'The Verge -  All Posts', 'title_detail': {'type': 'text/plain', 'language': 'en', 'base': 'https://www.theverge.com/rss/full.xml', 'value': 'The Verge -  All Posts'}, 'icon': 'https://cdn.vox-cdn.com/community_logos/52801/VER_Logomark_32x32..png', 'updated': '2021-04-10T17:10:04-04:00', 'updated_parsed': time.struct_time(tm_year=2021, tm_mon=4, tm_mday=10, tm_hour=21, tm_min=10, tm_sec=4, tm_wday=5, tm_yday=100, tm_isdst=0), 'id': 'https://www.theverge.com/rss/full.xml', 'guidislink': True, 'link': 'https://www.theverge.com/', 'links': [{'type': 'text/html', 'href': 'https://www.theverge.com/', 'rel': 'alternate'}]})
 ------------------------- 
('headers', {'connection': 'close', 'content-length': '25356', 'content-type': 'application/xml; charset=utf-8', 'server': 'nginx', 'x-frame-options': 'SAMEORIGIN', 'x-xss-protection': '1; mode=block', 'x-content-type-options': 'nosniff', 'x-download-options': 'noopen', 'x-permitted-cross-domain-policies': 'none', 'referrer-policy': 'strict-origin-when-cross-origin', 'access-control-allow-origin': '*', 'cache-control': 'max-age=60, public, must-revalidate', 'etag': 'W/"5295f94e0debbe3f16a09486de9a2f77"', 'x-request-id': '952c63d6eaa28f26cf6859b87757e2684bb3c010', 'x-runtime': '0.058459', 'strict-transport-security': 'max-age=31556952; preload', 'content-encoding': 'gzip', 'accept-ranges': 'bytes', 'date': 'Sun, 11 Apr 2021 10:47:47 GMT', 'via': '1.1 varnish', 'age': '311', 'x-served-by': 'cache-itm18847-ITM', 'x-cache': 'HIT', 'x-cache-hits': '1', 'x-timer': 'S1618138067.078133,VS0,VE1', 'vary': 'X-Chorus-Unison-Testing, X-Chorus-Require-Privacy-Consent, X-Chorus-Restrict-In-Privacy-Consent-Region, Origin, X-Forwarded-Proto, Accept-Encoding, Cookie, X-Chorus-Unison-Testing, X-Chorus-Require-Privacy-Consent, X-Chorus-Restrict-In-Privacy-Consent-Region', 'set-cookie': 'vmidv1=5d902645-5994-40a3-87ab-74b5c080fcb9;Expires=Fri, 10 Apr 2026 10:47:47 GMT;Domain=www.theverge.com;Path=/;SameSite=Lax;Secure'})
 ------------------------- 
##### TODO 
('etag', 'W/"5295f94e0debbe3f16a09486de9a2f77"')
 ------------------------- 
('href', 'https://www.theverge.com/rss/full.xml')
 ------------------------- 
('status', 200)
 ------------------------- 
('encoding', 'utf-8')
 ------------------------- 


('version', 'atom10')


 ------------------------- 


('namespaces', {'': 'http://www.w3.org/2005/Atom'})
>>> 


>>> for i in verge_feed['entries']:
...     print("\n\n ------------------------- \n\n")
...     print(i)
... 
 ------------------------- 

{'published': '2021-04-10T17:10:04-04:00', 
 'published_parsed': time.struct_time(tm_year=2021, tm_mon=4, tm_mday=10, tm_hour=21, tm_min=10, tm_sec=4, tm_wday=5, tm_yday=100, tm_isdst=0), 
 'updated': '2021-04-10T17:10:04-04:00',
 'updated_parsed': time.struct_time(tm_year=2021, tm_mon=4, tm_mday=10, tm_hour=21, tm_min=10, tm_sec=4, tm_wday=5, tm_yday=100, tm_isdst=0), 
'title': 'China fines Alibaba $2.8 billion after antitrust investigation', 'title_detail': {'type': 'text/plain', 'language': 'en', 
'base': 'https://www.theverge.com/rss/full.xml', 'value': 'China fines Alibaba $2.8 billion after antitrust investigation'},
 'content': [{'type': 'text/html', 'language': 'en', 'base': 'https://www.theverge.com/rss/full.xml', 
'value': "" 

 ------------------------- 
>>> verge_feed['entries'][6].keys()
dict_keys(['published', 'published_parsed', 'updated', 'updated_parsed', 'title', 'title_detail', 'content', 'summary', 'links', 'link', 'id', 'guidislink', 'authors', 'author_detail', 'author'])

# ======================================================
>>> hacker_url='https://www.reddit.com/r/hackernews/.rss'
>>> hacker_feed=feedparser.parse(hacker_url)

>>> cnn_url='http://rss.cnn.com/rss/cnn_world'
>>> cnn_feed=feedparser.parse(cnn_url)
>>> cnn_feed['entries'][0].keys()
dict_keys(['title', 'title_detail', 'summary', 'summary_detail', 'links', 'link', 'id', 'guidislink', 'published', 'published_parsed', 'media_content', 'feedburner_origlink'])

>>> zaobao_url='https://rsshub.app/zaobao/realtime/world'
>>> zaobao_feed=feedparser.parse(zaobao_url)
>>> len(zaobao_feed['entries'])
