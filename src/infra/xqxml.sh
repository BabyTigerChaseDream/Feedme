

curl https://www.dw.com/en/news-sitemap.xml | xq '.'
curl https://www.dw.com/en/news-sitemap.xml | xq '..|keys'
curl https://www.dw.com/en/news-sitemap.xml | xq 'paths | select(.[-1] == "@xmlns:news")'
curl https://www.dw.com/en/news-sitemap.xml | xq 'paths as $p| getpath($p) as $v|select($p[-1] == "@xmlns:news")|$v'
curl https://www.dw.com/en/news-sitemap.xml | xq 'paths'
curl https://www.dw.com/en/news-sitemap.xml | xq 'paths as $p| getpath($p) as $v|select($p[-1] == "news:title")|$v'
curl https://www.dw.com/en/news-sitemap.xml | xq 'paths | select(.[-1] == "news:title")'
curl https://www.dw.com/en/news-sitemap.xml | xq -c 'paths | select(.[-1] == "news:title")'

# search for keywords 
curl 'https://www.dw.com/research/?languageCode=en&searchNavigationId=9097&period=DAY&sort=DATE&resultsCounter=10' \
  -H 'authority: www.dw.com' \
  -H 'pragma: no-cache' \
  -H 'cache-control: no-cache' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"' \
  -H 'accept: */*' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.dw.com/search/?languageCode=en&searchNavigationId=9097&period=DAY&sort=DATE&resultsCounter=10' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6' \
  -H 'cookie: atidvisitor=%7B%22name%22%3A%22atidvisitor%22%2C%22val%22%3A%7B%22vrn%22%3A%22-510544-%22%7D%2C%22options%22%3A%7B%22path%22%3A%22%2F%22%2C%22session%22%3A15724800%2C%22end%22%3A15724800%7D%7D; _pbjs_userid_consent_data=3524755945110770; _pubcid=82ba642c-fe60-4665-8942-195e322831e1; atidvisitor=%7B%22name%22%3A%22atidvisitor%22%2C%22val%22%3A%7B%22vrn%22%3A%22-510544-%22%7D%2C%22options%22%3A%7B%22path%22%3A%22%2F%22%2C%22session%22%3A15724800%2C%22end%22%3A15724800%7D%7D; _pc_c=ff24e981-bffa-6bdf-b07c-64062f29c211; _pc_t=tracking_enabled; __gads=ID=803f38a9b6176833:T=1647385412:S=ALNI_MZfzQlyt77bu4kLX0HHqGB59WN_pg; ga-disable-UA-109618266-1=false; _ga=GA1.2.50057945.1647385407; _fbp=fb.1.1647385440095.773252097; OB-USER-TOKEN=1405094a-c98f-4864-887a-7c0c56dd0200; _gid=GA1.2.496883151.1651664208; __gpi=UID=000004af37bf77e7:T=1649548635:RT=1651664212:S=ALNI_MZEcUx-HrPYxG5wjfYHciE_MpZo1w; _pc_st=1651667204548; _pc_lr=1651667949182; cto_bidid=W5GVXV9URWpRbGIlMkZ0UHhLRHozQk51cmwxUnolMkZXcWtOaTJ6eXR5TSUyQnNoeiUyQkdsRWtrZE01d2VhNlB3b3lUOXRzc2Y4OFZ2elVFVjFCRThrNUk2R3NRWm9pRkRYV3ZpbTJvZnlDNWpzR3JaQkVXNkE0JTNE; cto_bundle=BL2X_18lMkJuWEFlemk0Qk1wZEw0ME9IJTJGWFB1dzZzWmF1RXNYSllqcXpXNVNJZEJxc2VXbFM4RWhlcW5FbWdyczhibTluTUlvc0l1NUlpa0lobDF3M1p3TjBHNXVkc3BiVzlwSGVSJTJGdkVkRnFYJTJCckszJTJCNTBqWkVZdGM4cyUyRm91WUJHdmJBRUNVN2tlSU50azkwJTJCVndOWlFQc21pUSUzRCUzRA' \
  --compressed