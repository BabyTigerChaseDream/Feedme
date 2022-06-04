#!/bin/sh
curl --location --request GET 'https://www.dw.com/en/germany/s-1432' 
--header 'pragma: no-cache' 
--header 'cache-control: no-cache' 
--header 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"' 
--header 'sec-ch-ua-mobile: ?0' 
--header 'sec-ch-ua-platform: "Linux"' 
--header 'upgrade-insecure-requests: 1' 
--header 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36' 
--header 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' 
--header 'sec-fetch-site: same-origin' 
--header 'sec-fetch-mode: navigate' 
--header 'sec-fetch-user: ?1' 
--header 'sec-fetch-dest: document' 
--header 'referer: https://www.dw.com/en/top-stories/s-9097' 
--header 'accept-encoding: gzip, deflate, br' 
--header 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6' 
--compressed

## can get all articles
#curl https://www.dw.com/en/germany/s-1432